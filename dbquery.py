from flask import Flask
from flask_mysqldb import MySQL 

# hamo_status_ids -> 0 = pending, 1 = passed, 2 = failed

def getAllHamoRecords(mysql):
    cur = mysql.connection.cursor()
    command = "SELECT * FROM hamo_wash_cycle"
    cur.execute(command)
    data = cur.fetchall()
    return data

# retrieves all unhidden/deleted hamo records in descending order
def getAllShownHamoRecords(mysql):
    cur = mysql.connection.cursor()
    command = "SELECT * From hamo_wash_cycle where is_hidden = 0 ORDER BY date_added DESC"
    cur.execute(command)
    data = cur.fetchall()
    return data

# retrieves all hidden/deleted hamo records in descending order
def getAllHiddenHamoRecords(mysql):
    cur = mysql.connection.cursor()
    command = "SELECT * FROM hamo_wash_cycle where is_hidden = 1 ORDER BY date_added DESC"
    cur.execute(command)
    data = cur.fetchall()
    return data

# inserts a new row into hamo_wash_cycle table
def addNewHamoRecord(mysql):
    cur = mysql.connection.cursor()
    command = "INSERT INTO hamo_wash_cycle(date_added,hamo_stage_one_status_id,hamo_stage_two_status_id,hamo_stage_three_status_id) VALUES (now(),0,0,0)"
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid

# retrieves the most current id from hamo_wash_cycle table    
def getHamoRecordById(mysql, hamo_record_id):
    cur = mysql.connection.cursor()
    command = "SELECT * FROM hamo_wash_cycle where id = " + str(hamo_record_id)
    cur.execute(command)
    hamo_record = cur.fetchall()[0]
    return hamo_record

# updates current row data with stage one fields
def updateHamoRecordStageOne(mysql,hamo_record_id,hamo_machine_id,calibration_expiry_date,daily_test_confirmation):
    cur = mysql.connection.cursor()
    command = "update hamo_wash_cycle set hamo_machine_id = '" + hamo_machine_id + "', calibration_expiry_date = '" + calibration_expiry_date + "', daily_test_confirmation = '" + daily_test_confirmation + "', hamo_stage_one_status_id = 1"
    command = command + " where id = " + hamo_record_id
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid

# updates current row data with stage two fields
def updateHamoRecordStageTwo(mysql,hamo_record_id,load_type,wash_type,full_wash_chemical_list,rinse_wash_tubing_list):
    cur = mysql.connection.cursor()
    command = "update hamo_wash_cycle set wash_type = '" + wash_type + "', hamo_stage_two_status_id = 1, full_wash_chemical_list = '" + full_wash_chemical_list + "', rinse_wash_tubing_list = '" + rinse_wash_tubing_list + "', load_type = '" + load_type + "'"
    command = command + " where id = " + hamo_record_id
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid

# updates current row data with stage three full wash fields
def updateHamoRecordStageThreeFullWash(mysql,hamo_record_id,pre_wash_passed,caustic_wash_passed,acid_wash_passed,final_rinse_passed,drying_stage_passed, comments):
    cur = mysql.connection.cursor()
    command = "update hamo_wash_cycle set hamo_stage_three_status_id = 1, pre_wash_passed = '" + pre_wash_passed + "', caustic_wash_passed = '" + caustic_wash_passed + "', acid_wash_passed = '"+ acid_wash_passed +"', final_rinse_passed = '"+ final_rinse_passed +"', drying_stage_passed = '" + drying_stage_passed + "', cycle_result = 'Pass', comments = '" + comments + "', wash_expiration_date = now() + INTERVAL 10 DAY"
    command = command + " where id = " + hamo_record_id
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid

# updates current row data with stage three rinse wash fields
def updateHamoRecordStageThreeRinseWash(mysql,hamo_record_id,final_rinse_passed,drying_stage_passed, comments):
    cur = mysql.connection.cursor()
    command = "update hamo_wash_cycle set hamo_stage_three_status_id = 1, final_rinse_passed = '"+ final_rinse_passed +"', drying_stage_passed = '" + drying_stage_passed + "', cycle_result = 'Pass', comments = '" + comments + "', wash_expiration_date = now() + INTERVAL 10 DAY"
    command = command + " where id = " + hamo_record_id
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid

# updates is_hidden field with hamo record
def updateIsHidden(mysql,hamo_record_id):
    cur = mysql.connection.cursor()
    command = "update hamo_wash_cycle set is_hidden = 1"
    command = command + " where id = " + hamo_record_id
    cur.execute(command)
    mysql.connection.commit()
    return cur.lastrowid