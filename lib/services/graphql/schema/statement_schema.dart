class StatementSchema {
  getStatements() {
    return """ 
    query getReports(\$reportOptions: ReportOptions!) {
      getReports(reportOptions: \$reportOptions) {
        invoice {
          full_name
        }
        opening_balance {
          amount
        }
        rent {
          amount
        }
        payment {
          amount
        }
        services {
          amount
        }
        credits {
          amount
          reason
        }
        debits{
          amount
          reason
        }
        closing_balance {
          amount
        }
      }
    }
    """;
  }

  getInvoice() {
    return """ 
      query getInvoices(\$posterOptions: PosterOptions!){
        getInvoices(posterOptions: \$posterOptions){
          invoice{
            full_name
          }
          opening_balance{
            amount
          }
          services{
            amount
          }
          payment{
            amount
          }
          rent {
            room_no
            price 
            factor
            rental_period
            amount
          }
          credits {
            amount
            reason
          }
          debits{
            amount
            reason
          }
          closing_balance{
            amount
          }
        }
      }
""";
  }
}
