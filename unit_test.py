from hamoapp import app
import unittest
import dbquery
import os

class testViewMethods(unittest.TestCase):
    
    # Ensure that the app pages return http status 200
    def test_main_routes(self):
        
        tester = app.test_client(self)
        
        response = tester.get('/', content_type='html/text')
        self.assertEqual(response.status_code, 200)

        response = tester.get('/hidden-hamo-records/', content_type='html/text')
        self.assertEqual(response.status_code, 200)
    
    def test_view_hamo_record(self):

        tester = app.test_client(self)
        response = tester.get('/view-hamo-record/?id=1',content_type='html/text')
        # print(response.get_data(as_text=True))
        expected_file_path = os.path.join('.','test','view-hamo-record-test.html')
        #expected_file_handle = open(expected_file_path,'w')
        #expected_file_handle.write(response.get_data(as_text=True))
        expected_file_handle = open(expected_file_path,'r')
        expected_html = expected_file_handle.read()
        actual_html = response.get_data(as_text=True)
        expected_file_handle.close()
        self.assertEqual(expected_html, actual_html)

    # Ensure that deleted view loads correctly
    def test_deleted_view_loads(self):
        tester = app.test_client(self)
       # response = tester.get('/hidden-hamo-records', content_type='html/text')
        #self.assertTrue(b'Deleted Hamo Records' in response.data)

    # Ensure add hamo record starts a new record in DB
    
    # Ensure update hamo stage one posts correct information to DB
    def test_update_hamo_record_stage_one(self):
        pass        
        #updateHamoRecordStageOne



    # Ensure update hamo stage two posts correct information to DB
    def test_update_hamo_record_stage_two(self):
        pass
        #updateHamoRecordStageTwo


    # Ensure update hamo stage three full wash posts correct information to DB
    def test_update_hamo_record_stage_three_full_wash(self):
        pass
        ##updateHamoRecordStageThreeFullWash

    # Ensure update hamo stage three rinse wash posts correct information to DB
    def test_update_hamo_record_stage_three_rinse_wash(self):
        pass
        #updateHamoRecordStageThreeRinseWash

    

if __name__ == '__main__':
    unittest.main()