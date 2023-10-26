
        string fileName = "c:\\134\\Exercises\\Ex25xmlEmployees.xml";
	    System.IO.StreamWriter oStreamWriter = new System.IO.StreamWriter(fileName);
        string fileContents = *****************;  //Todo here
        try
	        {
            oStreamWriter.Write(fileContents);
	        }
        catch (Exception ex)
	        {
            MessageBox.Show(ex.Message);
            Dts.TaskResult = (int)ScriptResults.Failure;
            return;
            }
        oStreamWriter.Close();