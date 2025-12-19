<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="lab3_dbHoa.ThemHoa" %>
<asp:Content ID="ThemHoa" ContentPlaceHolderID="NoiDung" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div style="padding: 10px 10px">
        <table cellpadding="11" align="center" class="auto-style1">
            <tr>
                <td style="color: #FFFFFF; background-color: #0066FF; font-size: large;" colspan="2">THÊM HOA MỚI</td>
            </tr>
            <tr>
                <td class="auto-style5">Danh mục</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlLoai" runat="server" Style="width: 80%; text-align: left" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Tên hoa

                    <asp:RequiredFieldValidator ID="reftxtTenHoa" runat="server" ControlToValidate="txtTenHoa" Display="Dynamic" ErrorMessage="Vui lòng không để trống tên hoa" ForeColor="Red">*</asp:RequiredFieldValidator>
                     
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtTenHoa" TextMode="SingleLine" runat="server" Style="width: 80%; text-align: left"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Giá
                    <asp:RegularExpressionValidator ID="revtxtGia"
                        runat="server" ErrorMessage="Giá tiền phải là số" ControlToValidate="txtGia"
                        ForeColor="Red" ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic">*
                    </asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="reftxtGia"
                         runat="server" ControlToValidate="txtGia"
                         Display="Dynamic" ErrorMessage="Vui lòng không để trống giá tiền" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvGia" runat="server"
                        ErrorMessage="Giá tiền phải lớn hơn 0" ControlToValidate="txtGia" Display="Dynamic" ForeColor="Red"
                        Operator="GreaterThanEqual" ValueToCompare="0">*</asp:CompareValidator>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtGia" TextMode="SingleLine" runat="server" Style="width: 80%; text-align: left"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style5">Ngày cập nhật</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtNgayCapNhat" TextMode="Date" runat="server" Style="width: 80%; text-align: left"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Hình</td>
                <td class="auto-style7">
                    <asp:FileUpload ID="HinhUpload" Style="width: 80%; text-align: left" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <asp:ValidationSummary ID="vsLoi" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnThemHoa" runat="server" Text="Thêm Hoa" CssClass="btn btn-success" OnClick="btnThemHoa_Click" />
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Hoa] WHERE [MaHoa] = @MaHoa" InsertCommand="INSERT INTO [Hoa] ([TenHoa], [Gia], [Hinh], [MaLoai], [NgayDang], [SoLuotXem]) VALUES (@TenHoa, @Gia, @Hinh, @MaLoai, @NgayDang, @SoLuotXem)" SelectCommand="SELECT * FROM [Hoa]" UpdateCommand="UPDATE [Hoa] SET [TenHoa] = @TenHoa, [Gia] = @Gia, [Hinh] = @Hinh, [MaLoai] = @MaLoai, [NgayDang] = @NgayDang, [SoLuotXem] = @SoLuotXem WHERE [MaHoa] = @MaHoa">
        <DeleteParameters>
            <asp:Parameter Name="MaHoa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenHoa" Type="String" />
            <asp:Parameter Name="Gia" Type="Double" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="MaLoai" Type="Int32" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="SoLuotXem" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenHoa" Type="String" />
            <asp:Parameter Name="Gia" Type="Double" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="MaLoai" Type="Int32" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="SoLuotXem" Type="Int32" />
            <asp:Parameter Name="MaHoa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>

