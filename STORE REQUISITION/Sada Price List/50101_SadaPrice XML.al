xmlport 50149 import//50101 
{
    Format = VariableText;
    Direction = Import;
    TextEncoding = WINDOWS;
    UseRequestPage = false;
    //FileName = '.csv';
    TableSeparator = '<New Line>';//New line
    schema
    {
        textelement(root)
        {
            tableelement(Sadapricelist; Sadapricelist)
            {
                fieldattribute(ProductbU; Sadapricelist.ProductBU)
                {
                }
                fieldattribute(ProductbUcode; Sadapricelist.ProductBUCode)
                {
                }
                fieldattribute(Productgroup; Sadapricelist.Productgroup)
                {
                }
                fieldattribute(Productgroupcode; Sadapricelist.ProductGroupCode)
                {
                }
                fieldattribute(MPN; Sadapricelist.MPN)
                {
                }
                fieldattribute(Name; Sadapricelist.Name)
                {
                }
                fieldattribute(customer; Sadapricelist.Customer)
                {
                }
                fieldattribute(endcustomer; Sadapricelist."End Customer")
                {
                }
                fieldattribute(debitnumber; Sadapricelist."Debit Number")
                {
                }
                fieldattribute(RegNo; Sadapricelist.RegNo)
                {
                }
                fieldattribute(E2ContractNr; Sadapricelist."E2 Contract Nr")
                {
                }
                fieldattribute(DebitStatus; Sadapricelist.DebitStatus)
                {
                }
                fieldattribute(ItemStartDate; Sadapricelist."Item Start Date")
                {
                }
                fieldattribute(ItemExpiryDate; Sadapricelist."Item Expiry Date")
                {
                }
                fieldattribute("RegItemExpDate"; Sadapricelist."Reg Item Exp Date")
                {
                }
                fieldattribute("RegitemStatus"; Sadapricelist."Reg item Status")
                {
                }
                fieldattribute(Currency; Sadapricelist.Currency)
                {
                }
                fieldattribute("DebitItemNum"; Sadapricelist."Debit Item Num")
                {
                }
                fieldattribute("DebitReqQty"; Sadapricelist."Debit Req Qty")
                {
                }
                fieldattribute("DebitShipQty"; Sadapricelist."Debit Ship Qty")
                {
                }
                fieldattribute("DebitOpenQty"; Sadapricelist."Debit Open Qty")
                {
                }
                fieldattribute(Adjcost; Sadapricelist."Adj. Cost")
                {
                }
                fieldattribute("AdjResale"; Sadapricelist."Adj. Resale")
                {
                }
                fieldattribute(DBC; Sadapricelist.DBC)
                {
                }
                fieldattribute("DebitOpenQtyPercentage"; Sadapricelist."Debit Open Qty Percentage")
                {
                }
                fieldattribute("IsMQ"; Sadapricelist."Is MQ")
                {
                }
                fieldattribute(DistiShiptoname; Sadapricelist.DistiShiptoname)
                {
                }
                fieldattribute("CustomerCity"; Sadapricelist."Customer City")
                {
                }
                fieldattribute("CustomerState"; Sadapricelist."Customer State")
                {
                }
                fieldattribute("CustomerZip"; Sadapricelist."Customer Zip")
                {
                }
                fieldattribute("CustomerCountry"; Sadapricelist."Customer Country")
                {
                }
                fieldattribute("EndCustomerCity"; Sadapricelist."End Customer City")
                {
                }
                fieldattribute("EndCustomerState"; Sadapricelist."End Customer State")
                {
                }
                fieldattribute("EndCustomerZip"; Sadapricelist."End Customer Zip")
                {
                }
                fieldattribute("EndCustomerCountry"; Sadapricelist."End Customer Country")
                {
                }
                trigger OnBeforeInsertRecord()
                begin
                    IF Heading then begin  ////skip heading of csv
                        Heading := false;
                        currxmlport.skip;
                    end;
                end;
            }
        }
    }
    trigger OnPreXmlPort()
    begin
        Heading := true;
    end;

    trigger OnPostXmlPort()
    begin
        Message('XML Uploaded Successfully');
    end;

    var
        Heading: Boolean;

}