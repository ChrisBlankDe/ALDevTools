page 60000 "PTEGetRequestPageParameters"
{
    Caption = 'Get Request Page Parameters';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ReportId; ReportId)
                {
                    Caption = 'Report ID';
                    TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
                }
                field(ReportName; ReportName)
                {
                    Caption = 'Report Name';
                    Editable = false;
                }
                field(RequestPageXml; RequestPageXml)
                {
                    Caption = 'Request Page XML';
                    Editable = false;
                    MultiLine = true;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RunRequestPage)
            {
                Caption = 'Run Request Page';
                Image = TestReport;
                trigger OnAction()
                begin
                    RequestPageXml := Report.RunRequestPage(ReportId);
                end;
            }

        }
        area(Promoted)
        {
            actionref(RunRequestPage_Promoted; RunRequestPage) { }
        }
    }
    var
        ReportId: Integer;
        ReportName: Text;
        RequestPageXml: Text;
}