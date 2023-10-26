	string topSalary,  person,  strMsg;
        topSalary = Dts.Variables["TopSalary"].Value.ToString();
        person = (Dts.Variables["FullName"].Value.ToString()).Trim();
        strMsg = "Person: " + person;
        strMsg += "\r\n" + "Salary: " + topSalary;
        MessageBox.Show(strMsg);
		