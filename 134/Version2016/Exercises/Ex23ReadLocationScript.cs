			// TODO: Add your code here
            string location;
            System.IO.StreamReader oStream = new System.IO.StreamReader("***************"); //Todo: 1 (Hint: C# requires \ to be escaped, i.e. \\).
            string infoString;
            location = oStream.ReadLine();
            oStream.Close();

            ********************* = location;  //Todo: 2  (Hint: See last line in this code block for how InfoToWrite variable has been referenced).
            infoString = "Location: " + location;
            infoString += "\r\n" + "User Name: " + **********************************;  //Todo: 3 (Hint: see how the MachineName variable has been referenced on the next line.)
            infoString += "\r\n" + "Machine Name: " + Dts.Variables["MachineName"].Value.ToString();
            infoString += "\r\n" + "Package Name: " + Dts.Variables["PackageName"].Value.ToString();
            infoString += "\r\n" + "Start Time: " + Dts.Variables["StartTime"].Value.ToString();
            Dts.Variables["InfoToWrite"].Value = infoString;
