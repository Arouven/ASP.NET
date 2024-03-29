﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="portfolio-grid-4.aspx.vb" Inherits="JP.portfolio_grid_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="page-content bg-white">
    <!-- inner page banner -->
    <div class="dez-bnr-inr overlay-black-middle" style="background-image: url(images/banner/bnr2.jpg);">
      <div class="container">
        <div class="dez-bnr-inr-entry">
          <h1 class="text-white">Portfolio Grid 4</h1>
          <!-- Breadcrumb row -->
          <div class="breadcrumb-row">
            <ul class="list-inline">
              <li><a href="#">Home</a></li>
              <li>Portfolio Grid 4</li>
            </ul>
          </div>
          <!-- Breadcrumb row END -->
        </div>
      </div>
    </div>
    <!-- inner page banner END -->
    <!-- contact area -->
    <div class="content-block">
      <div class="section-full content-inner-2 portfolio-box">
        <div class="container">
          <div class="section-head text-black text-center m-b20">
            <h2 class="m-b10">Our Portfolio</h2>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
          </div>
          <div class="site-filters style1 clearfix center">
            <ul class="filters" data-toggle="buttons">
              <li data-filter="" class="btn active">
                <input type="radio"><a href="#"><span>All</span></a></li>
              <li data-filter="web" class="btn">
                <input type="radio"><a href="#"><span>Designing</span></a></li>
              <li data-filter="advertising" class="btn">
                <input type="radio"><a href="#"><span>Construct</span></a></li>
              <li data-filter="branding" class="btn">
                <input type="radio"><a href="#"><span>Finance</span></a></li>
              <li data-filter="design" class="btn">
                <input type="radio"><a href="#"><span>Development</span></a></li>
              <li data-filter="photography" class="btn">
                <input type="radio"><a href="#"><span>Archeology</span></a></li>
            </ul>
          </div>
          <div class="clearfix">
            <ul id="masonry" class="dez-gallery-listing gallery-grid-4 gallery mfp-gallery sp10">
              <li class="web design card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic1.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic1.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="advertising branding photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect dez-img-effect ">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic2.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic2.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="branding design photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic3.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic3.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="web design card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic4.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic4.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="web branding card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic5.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic5.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="advertising design photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect ">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic6.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic6.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="web branding card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic7.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic7.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="advertising design photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect dez-img-effect ">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic8.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic8.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="web photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic9.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic9.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="advertising branding card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic1.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic1.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="web design card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic2.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic2.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="advertising branding photography card-container col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="dez-box dez-gallery-box">
                  <div class="dez-media dez-img-overlay1 dez-img-effect ">
                    <a href="javascript:void(0);">
                      <img src="images/gallery/pic3.jpg" alt="">
                    </a>
                    <div class="overlay-bx">
                      <div class="overlay-icon">
                        <a class="mfp-link" title="Image Title Come Here" href="images/gallery/pic3.jpg"><i class="ti-fullscreen"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- contact area END -->
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder1" runat="server">
</asp:Content>
