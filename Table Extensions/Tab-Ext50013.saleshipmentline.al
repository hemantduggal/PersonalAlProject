tableextension 50013 "sale shipment line" extends "Sales Shipment Line"
{
    fields
    {
        field(5000; "ItemUnitMeasure code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code;
        }
    }
}
