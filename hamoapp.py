from flask import Flask, render_template, url_for, redirect, request
from flask_mysqldb import MySQL
import dbquery
import json

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'hamo_records_db'
app.config['MYSQL_PASSWORD'] = 'testpassword'
app.config['MYSQL_DB'] = 'hamo_records_db'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/', methods=['GET'])
def index():

    # 1. select all hamo records. Populate into template. Loop over records in index.html table.
    data = dbquery.getAllShownHamoRecords(mysql)
    
    # 2. return index page
    return render_template('index.html', data = data)
    

@app.route('/edit-hamo-record/')
def addHamoRecord():

    # 1. check if hamo record id is in path or get param
    # 2. if no hamo record id, create new hamo record
    # 3. If hamo record id found, get hamo record and show correct stage of form, based on status fields

    hamo_record_id = request.args.get("id")

    if not hamo_record_id:

        # create new record and redirect back to this page with the new id in the path
        new_pk = dbquery.addNewHamoRecord(mysql)
        return redirect("/edit-hamo-record/?id="+str(new_pk))

    else:

        # get the hamo record and determine which stage of the process user is at.
        hamo_record = dbquery.getHamoRecordById(mysql,hamo_record_id)

        template_data = {}
        template_data['hamo_record'] = hamo_record

        if hamo_record['hamo_stage_one_status_id'] == 0:
            # "hamo stage one"
            template_data['current_hamo_stage'] = 1

        elif hamo_record['hamo_stage_one_status_id'] == 1 and hamo_record['hamo_stage_two_status_id'] == 0:
            # "hamo stage two"
            template_data['current_hamo_stage'] = 2

        elif hamo_record['hamo_stage_one_status_id'] == 1 and hamo_record['hamo_stage_two_status_id'] == 1 and hamo_record['hamo_stage_three_status_id'] == 0 and hamo_record['wash_type'] == "Full Wash":
            template_data['current_hamo_stage'] = 3
        
        elif hamo_record['hamo_stage_one_status_id'] == 1 and hamo_record['hamo_stage_two_status_id'] == 1 and hamo_record['hamo_stage_three_status_id'] == 0 and hamo_record['wash_type'] == "Rinse Wash":
            template_data['current_hamo_stage'] = 4
    
    return render_template('add-hamo-record.html',data=template_data)


@app.route('/save-hamo-stage-one', methods=['POST'])
def saveHamoStageOne():
    
    # 1. get the form data including the id from the request
    hamo_record_id = request.form.get("hamo_record_id")

    hamo_machine_id = request.form.get("hamo_machine_id")
    calibration_expiry_date = request.form.get("calibration_expiry_date")
    daily_test_confirmation = request.form.get("daily_test_confirmation")

    # 2. pass this into the update_hamo_record_stage_one method
    id = dbquery.updateHamoRecordStageOne(mysql,hamo_record_id,hamo_machine_id,calibration_expiry_date,daily_test_confirmation)

    # 3. redirect to /edit-hamo-record/?id=<>
    return redirect("/edit-hamo-record/?id="+str(hamo_record_id))

@app.route('/save-hamo-stage-two', methods=['GET','POST'])
def saveHamoStageTwo():
    # 1. get the form data including the id from the request
    hamo_record_id = request.form.get("hamo_record_id")

    load_type = request.form.get("load_type")
    wash_type = request.form.get("wash_type")
    if wash_type == 'Full Wash':

        caustic_lot_number = request.form.get("caustic_lot_number")
        caustic_expiry_date = request.form.get("caustic_expiry_date")
        acid_lot_number = request.form.get("acid_lot_number")
        acid_expiry_date = request.form.get("acid_expiry_date")
        
        full_wash_chemical_list = dbquery.buildFullChemicalList(caustic_lot_number,caustic_expiry_date,acid_lot_number,acid_expiry_date)
        rinse_wash_tubing_list = None

    elif wash_type == 'Rinse Wash':
        tubing_lot_number = request.form.get("tubing_lot_number")
        tubing_expiry_date = request.form.get("tubing_expiry_date")

        rinse_wash_tubing_list = dbquery.buildRinseWashTubingList(tubing_lot_number,tubing_expiry_date)
        full_wash_chemical_list = None

    if full_wash_chemical_list is None:
        full_wash_chemical_list = "N/A"
    if rinse_wash_tubing_list is None:
        rinse_wash_tubing_list = "N/A"

    # 2. pass this into the update_hamo_record_stage_two method
    dbquery.updateHamoRecordStageTwo(mysql,hamo_record_id,load_type,wash_type,full_wash_chemical_list,rinse_wash_tubing_list)

    # 3. redirect to edit-hamo-record
    return redirect("/edit-hamo-record/?id="+str(hamo_record_id))

    
@app.route('/save-hamo-stage-three-full-wash', methods=['POST'])
def saveHamoStageThreeFullWash():
    
    # 1. get the form data including the id from the request
    hamo_record_id = request.form.get("hamo_record_id")

    # 2. Get the args from the form (make sure the input elements have the correct name and value)
    hamo_machine_id = request.form.get("hamo_machine_id")
    
    pre_wash_passed = request.form.get("pre_wash_passed")
    caustic_wash_passed = request.form.get("caustic_wash_passed")
    acid_wash_passed = request.form.get("acid_wash_passed")
    final_rinse_passed = request.form.get("final_rinse_passed")
    drying_stage_passed = request.form.get("drying_stage_passed")
    comments = request.form.get("comments")
    
    # 3. pass this into the update_hamo_record_stage_three method
    id = dbquery.updateHamoRecordStageThreeFullWash(mysql,hamo_record_id,pre_wash_passed,caustic_wash_passed,acid_wash_passed,final_rinse_passed,drying_stage_passed, comments)
   
    # 4. redirect to index url
    return redirect("/")

@app.route('/save-hamo-stage-three-rinse-wash', methods=['POST'])
def saveHamoStageThreeRinseWash():
    
    # 1. get the form data including the id from the request
    hamo_record_id = request.form.get("hamo_record_id")

    # 2. Get the args from the form (make sure the input elements have the correct name and value)
    hamo_machine_id = request.form.get("hamo_machine_id")
    
    final_rinse_passed = request.form.get("final_rinse_passed")
    drying_stage_passed = request.form.get("drying_stage_passed")
    comments = request.form.get("comments")
    
    # 3. pass this into the update_hamo_record_stage_three method
    id = dbquery.updateHamoRecordStageThreeRinseWash(mysql,hamo_record_id,final_rinse_passed,drying_stage_passed, comments)
   
    # 4. redirect to index page
    return redirect("/")

@app.route('/view-hamo-record/', methods=['GET'])
def viewHamoRecord():
    
    # 1. get hamo record by id
    hamo_record_id = request.args.get("id")

    # 2. insert data into template
    data = dbquery.getHamoRecordById(mysql, hamo_record_id)
    
    # 3. display data in template
    return render_template('view-hamo-record.html', data = data)


@app.route('/hidden-hamo-records/', methods=['GET'])
def viewHiddenHamoRecord():
    
    # 1. get hamo record by id
    hamo_record_id = request.args.get("id")
    
    # 2. get all hamo records that are hidden
    data = dbquery.getAllHiddenHamoRecords(mysql)
    
    # 3. return populated template
    return render_template('hidden-hamo-records.html', data = data)


@app.route('/hide-hamo-record/', methods=['GET','POST'])
def hideHamoRecord():
    
    # 1. get the hamo id from the url
    hamo_record_id = request.args.get("id")

    # 2. Select all hidden hamo records. Populate into template. Loop over records in table.
    id = dbquery.updateIsHidden(mysql, hamo_record_id)

    #3. redirect back to index page
    return redirect('/')


if __name__ == '__main__':
    app.run(debug=True)
    