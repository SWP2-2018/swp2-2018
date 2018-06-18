<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "legalNotice");

%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Impressum</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Impressum</jsp:attribute>
    </t:navbar>

      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="underlined-title" data-pg-collapsed>
              </br>
              <div class="legalTitle">Berichtsheft Digital</div>
              <hr>
            </div>
            <div class="services-wrapper">
              <div class="row">
                <div class="col-md-6">
                  <h4><b>Impressum</b></h4>
                  <p>
                    Angaben gemäß § 5 TMG</br>
                    Hochschule für Technik Stuttgart</br>
                    Schellingstraße 24</br>
                    70174 Stuttgart</br>
                  </p>
                </div>
                <div class="col-md-6">
                  <h4><b>Verwendete Lizenzen:</b></h4>
                  <p>MIT (X11-Lizenz)</br>
                    BSD (modified)</br>
                    Apache 2.0</br>
                    LGPL</br>
                    MPL 1.1</br>
                    SIL. OFL 1.1</br>
                    GPL 2.0</br>
                    </br>
                    <b>Lizenzierung der Software unter GPLv3</b>
                  </p>
                </div>
            </div>
            </div>
          </div>
        </div>
      </div>



  </jsp:body>
</t:stdTempl>
