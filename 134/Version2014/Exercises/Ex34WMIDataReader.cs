            DataTableReader FileReader; DataTable FileTable;
            try
            {
                string strFileSystem, strFreeSpace, strSize, strMsg;
                FileTable = (DataTable)Dts.Variables["DiskInfo"].Value;
                FileReader = FileTable.CreateDataReader();
                while (FileReader.Read())
                {
                    strFileSystem = FileReader.GetString(0);
                    strSize = FileReader.GetString(1);
                    strFreeSpace = FileReader.GetString(2);
                    strMsg = "File system: " + strFileSystem + "\r\n";
                    strMsg += "Disk size: " + strSize + "\r\n";
                    strMsg += "Free space: " + strFreeSpace;
                    MessageBox.Show(strMsg);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                Dts.TaskResult = (int)ScriptResults.Failure;
            }
