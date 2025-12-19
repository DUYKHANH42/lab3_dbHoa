<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="lab3_dbHoa.TraCuu" %>
<asp:Content ID="TraCuu" ContentPlaceHolderID="NoiDung" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" CssClass="panel3">
            <asp:Label ID="Label2" runat="server" Text="Giá bán từ: " ></asp:Label>
            <asp:RegularExpressionValidator ID="revtxtTu"
                runat="server" ErrorMessage="Vui lòng nhập số" ControlToValidate="txtTu"
                ForeColor="Red" ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic">*
            </asp:RegularExpressionValidator>
            <asp:TextBox ID="txtTu" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="đến "></asp:Label>  
            <asp:RegularExpressionValidator ID="revtxtDen"
                runat="server" ErrorMessage="Vui lòng nhập số" ControlToValidate="txtDen"
                ForeColor="Red" ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic">*
            </asp:RegularExpressionValidator>
             <asp:TextBox ID="txtDen" runat="server"></asp:TextBox>
            <asp:Button ID="btnTimKiem" runat="server" Text="Tìm Kiếm" CssClass="btn btn-primary" CausesValidation="true" OnClick="btnTimKiem_Click" />
            <asp:ValidationSummary ID="vsLoi" runat="server" DisplayMode="List" ForeColor="Red" style="text-align: center" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="panel4">
            <asp:ListView ID="lsvHoa" runat="server" DataKeyNames="MaHoa" DataSourceID="dsHoa" GroupItemCount="4">
                <AlternatingItemTemplate>
                       <td class="px-4 py-3">
                    <div class="card text-center shadow-sm p-3 mx-auto" style="width:200px;">
                        <asp:Image ID="Image1" runat="server"
                            ImageUrl='<%# ResolveUrl("~/imgs/" + Eval("Hinh")) %>'
                            CssClass="img-fluid rounded mb-2"
                            Style="height:150px; object-fit:cover;" />

                        <asp:Label ID="TenHoaLabel" runat="server"
                            Text='<%# Eval("TenHoa") %>'
                            CssClass="font-weight-bold d-block" />

                        Giá:
                        <asp:Label ID="GiaLabel" runat="server"
                            Text='<%# Eval("Gia", "{0:N0} đ") %>'
                            CssClass="text-danger font-weight-bold d-block" />

                        Lượt xem:
                        <asp:Label ID="SoLuotXemLabel" runat="server"
                            Text='<%# Eval("SoLuotXem") %>' />
                         <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                    </div>
                </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">
                        <asp:Label ID="HinhLabel" runat="server" Text='<%# Eval("Hinh") %>' />
                        <br />
                        <asp:Label ID="TenHoaLabel" runat="server" Text='<%# Eval("TenHoa") %>' />
                        <br />
                        Giá bán:
                         <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                        <br />
                        SoLuotXem:
                         <asp:Label ID="SoLuotXemLabel" runat="server" Text='<%# Eval("SoLuotXem") %>' />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>Không có hoa trong tầm giá này</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>

                <InsertItemTemplate>
                    <td runat="server" style="">TenHoa:
                        <asp:TextBox ID="TenHoaTextBox" runat="server" Text='<%# Bind("TenHoa") %>' />
                        <br />
                        Gia:
                        <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                        <br />
                        Hinh:
                        <asp:TextBox ID="HinhTextBox" runat="server" Text='<%# Bind("Hinh") %>' />
                        <br />
                        MaLoai:
                        <asp:TextBox ID="MaLoaiTextBox" runat="server" Text='<%# Bind("MaLoai") %>' />
                        <br />
                        NgayDang:
                        <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' />
                        <br />
                        SoLuotXem:
                        <asp:TextBox ID="SoLuotXemTextBox" runat="server" Text='<%# Bind("SoLuotXem") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td class="px-4 py-3">
                          <div class="card text-center shadow-sm p-3 mx-auto" style="width:200px;">
                              <asp:Image ID="Image1" runat="server"
                                  ImageUrl='<%# ResolveUrl("~/imgs/" + Eval("Hinh")) %>'
                                  CssClass="img-fluid rounded mb-2"
                                  Style="height:150px; object-fit:cover;" />

                              <asp:Label ID="TenHoaLabel" runat="server"
                                  Text='<%# Eval("TenHoa") %>'
                                  CssClass="font-weight-bold d-block" />

                              Giá:
                              <asp:Label ID="GiaLabel" runat="server"
                                  Text='<%# Eval("Gia", "{0:N0} đ") %>'
                                  CssClass="text-danger font-weight-bold d-block" />

                              Lượt xem:
                              <asp:Label ID="SoLuotXemLabel" runat="server"
                                  Text='<%# Eval("SoLuotXem") %>' />
                              <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />

                          </div>
                      </td>
                </ItemTemplate>
                
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                              <table id="groupPlaceholderContainer" runat="server" class="table w-100 text-center">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                    
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">MaHoa:
                        <asp:Label ID="MaHoaLabel" runat="server" Text='<%# Eval("MaHoa") %>' />
                        <br />
                        TenHoa:
                        <asp:Label ID="TenHoaLabel" runat="server" Text='<%# Eval("TenHoa") %>' />
                        <br />
                        Gia:
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                        <br />
                        Hinh:
                        <asp:Label ID="HinhLabel" runat="server" Text='<%# Eval("Hinh") %>' />
                        <br />
                        MaLoai:
                        <asp:Label ID="MaLoaiLabel" runat="server" Text='<%# Eval("MaLoai") %>' />
                        <br />
                        NgayDang:
                        <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Eval("NgayDang") %>' />
                        <br />
                        SoLuotXem:
                        <asp:Label ID="SoLuotXemLabel" runat="server" Text='<%# Eval("SoLuotXem") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate> 
                </asp:ListView>
        </asp:Panel>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([Gia] >= @GiaTu) AND ([Gia] <= @GiaDen)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtDen" Name="GiaDen" DefaultValue="0" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtTu" Name="GiaTu" PropertyName="Text" DefaultValue="10000" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
