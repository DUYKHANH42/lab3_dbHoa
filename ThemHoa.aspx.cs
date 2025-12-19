using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab3_dbHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThemHoa_Click(object sender, EventArgs e)
        {
            try
            {
                string tenhoa = txtTenHoa.Text;
                string maloai = ddlLoai.SelectedValue;
                string gia = txtGia.Text;
                string ngaycapnhat = txtNgayCapNhat.Text;
                string hinh = "";
                if (HinhUpload.HasFile)
                {
                    string folder = Server.MapPath("~/imgs/");
                    string fileName = Path.GetFileName(HinhUpload.FileName);
                    string path = Path.Combine(folder, fileName);
                    HinhUpload.SaveAs(path);
                    hinh = fileName;
                }
                dsHoa.InsertParameters["TenHoa"].DefaultValue = tenhoa;
                dsHoa.InsertParameters["Gia"].DefaultValue = gia;
                dsHoa.InsertParameters["NgayDang"].DefaultValue = ngaycapnhat;
                dsHoa.InsertParameters["Hinh"].DefaultValue = hinh;
                dsHoa.InsertParameters["SoLuotXem"].DefaultValue = "0";
                dsHoa.InsertParameters["MaLoai"].DefaultValue = maloai;
                dsHoa.Insert();
                ScriptManager.RegisterStartupScript(this, GetType(), "success",
              "Swal.fire({ " +
              "icon: 'success', " +
              "title: 'Thành công', " +
              "text: 'Thêm hoa mới thành công!', " +
              "confirmButtonText: 'Đóng', " +
              "showCloseButton: true " +
              "});",
              true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
              "Swal.fire({ " +
              "icon: 'error', " +
              "title: 'Lỗi', " +
              "text: 'Thêm hoa thất bại!', " +
              "confirmButtonText: 'Đóng', " +
              "showCloseButton: true " +
              "});",
              true);

            }
        }
    }
}