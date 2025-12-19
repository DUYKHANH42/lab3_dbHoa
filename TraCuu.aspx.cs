using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab3_dbHoa
{
    public partial class TraCuu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            double giaTu = 0;
            double giaDen = 100000000;
            if (!string.IsNullOrWhiteSpace(txtTu.Text))
                giaTu = double.Parse(txtTu.Text);

            if (!string.IsNullOrWhiteSpace(txtDen.Text))
                giaDen = double.Parse(txtDen.Text);
            dsHoa.SelectParameters["GiaTu"].DefaultValue = giaTu.ToString();
            dsHoa.SelectParameters["GiaDen"].DefaultValue = giaDen.ToString();

            lsvHoa.DataBind();
        }
    }
}