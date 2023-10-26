        	System.IO.StreamWriter oWriter = new System.IO.StreamWriter("c:\\134\\Exercises\\Ex23PackageExecution.txt");
        	oWriter.WriteLine(Dts.Variables["InfoToWrite"].Value.ToString());
        	oWriter.Close();