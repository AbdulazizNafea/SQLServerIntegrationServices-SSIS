public class ScriptMain : UserComponent
{
    string strCountry = "";
    int intCounter = 0;
    public override void Input0_ProcessInputRow(Input0Buffer Row)
    {
        /*
         * Add your code here
         */
        while (Row.NextRow())
        {
            if (Row.Country != strCountry)
            {
                intCounter = 1;
                strCountry = Row.Country;
                AggregatedRowsBuffer.AddRow();
                AggregatedRowsBuffer.Country = strCountry;
                AggregatedRowsBuffer.FirstName = Row.FirstName;
                AggregatedRowsBuffer.LastName = Row.LastName;
                AggregatedRowsBuffer.Email = Row.Email;
                AggregatedRowsBuffer.TotalAmount = Row.TotalAmount;
            }
            else if (intCounter < 20)
            {
                strCountry = Row.Country;
                intCounter += 1;
                AggregatedRowsBuffer.AddRow();
                AggregatedRowsBuffer.Country = strCountry;
                AggregatedRowsBuffer.FirstName = Row.FirstName;
                AggregatedRowsBuffer.LastName = Row.LastName;
                AggregatedRowsBuffer.Email = Row.Email;
                AggregatedRowsBuffer.TotalAmount = Row.TotalAmount;
            }
            
        }
        if (Row.EndOfRowset())
        {
            AggregatedRowsBuffer.SetEndOfRowset();
        }
    }
}
