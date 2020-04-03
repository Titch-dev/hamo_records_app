from hamoapp import app, mysql
import unittest
import dbquery
import os
from flask_mysqldb import MySQL

class testViewMethods(unittest.TestCase):
    
    # Ensure that the app pages return http status 200
    def test_main_routes(self):
        
        flask_tester = app.test_client(self)
        
        response = flask_tester.get('/', content_type='html/text')
        self.assertEqual(response.status_code, 200)

        response = flask_tester.get('/hidden-hamo-records/', content_type='html/text')
        self.assertEqual(response.status_code, 200)
    
    # testing the view_hamo_record html response matches with the expected
    def test_view_hamo_record(self):

        flask_tester = app.test_client(self)
        response = flask_tester.get('/view-hamo-record/?id=1',content_type='html/text')
        # print(response.get_data(as_text=True))
        expected_file_path = os.path.join('.','test','view-hamo-record-test.html')
        #expected_file_handle = open(expected_file_path,'w')
        #expected_file_handle.write(response.get_data(as_text=True))
        expected_file_handle = open(expected_file_path,'r')
        expected_html = expected_file_handle.read()
        actual_html = response.get_data(as_text=True)
        expected_file_handle.close()
        self.assertEqual(expected_html, actual_html)

    # testing that function returns rinse tubing list concatenated string
    def test_buildRinseWashTubingList(self):

        flask_tester = app.test_client(self)
        tubing_lot_number = 'P50532'
        tubing_expiry_date = '2020-02-25'
        expected_string = tubing_lot_number + ":" + tubing_expiry_date
        actual_string = dbquery.buildRinseWashTubingList(tubing_lot_number,tubing_expiry_date)
        self.assertEqual(expected_string, actual_string)

    # testing that function returns full wash chemical list concatenated string
    def test_buildFullChemicalList(self):

        flask_tester = app.test_client(self)
        caustic_lot_number = 'P55532'
        caustic_expiry_date = '2020-08-22'
        acid_lot_number = 'P43787'
        acid_expiry_date = '2021-06-15'
        expected_string = caustic_lot_number + ":" + caustic_expiry_date + " | " + acid_lot_number + ":" + acid_expiry_date
        actual_string = dbquery.buildFullChemicalList(caustic_lot_number,caustic_expiry_date,acid_lot_number,acid_expiry_date)

        self.assertEqual(expected_string, actual_string)
    

if __name__ == '__main__':
    unittest.main()