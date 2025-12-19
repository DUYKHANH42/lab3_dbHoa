<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="lab3_dbHoa.XemHoa" %>
<asp:Content ID="XemHoa" ContentPlaceHolderID="NoiDung" runat="server">
    <div id="myCarousel" class="carousel slide " data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">

            <div class="carousel-item active">
                <img src="imgs/banner1.jpeg" class="d-block w-100 carousel-img" alt="Khuyến Mãi">
            </div>

            <div class="carousel-item">
                <img src="imgs/banner2.jpeg" class="d-block w-100 carousel-img" alt="Giáng Sinh">
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div>
        <asp:Panel ID="Panel1" runat="server" CssClass="panel2">
            <asp:Label ID="Label1" runat="server" Width="100%" Text="Chọn danh mục hoa tại đây:"></asp:Label>
            <asp:DropDownList ID="ddlLoai" AutoPostBack="True" Width="100%" DataSourceID="dsLoai" runat="server" DataTextField="TenLoai" DataValueField="MaLoai"
                Style="text-align: center; margin: auto">
            </asp:DropDownList>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="panel3">
            <asp:ListView ID="lsvHoa" runat="server" DataKeyNames="MaHoa" DataSourceID="dsHoa" GroupItemCount="3" >
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
                            <td>Không có hoa thuộc danh mục này</td>
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
    </div>
    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
