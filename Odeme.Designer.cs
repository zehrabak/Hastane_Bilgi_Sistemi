namespace Hastane_Bilgi_Sistemi
{
    partial class Odeme
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_ekle = new System.Windows.Forms.Button();
            this.btn_guncelle = new System.Windows.Forms.Button();
            this.btn_sil = new System.Windows.Forms.Button();
            this.btn_ara = new System.Windows.Forms.Button();
            this.txt_tc = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.soyad = new System.Windows.Forms.Label();
            this.txt_toplamTutar = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txt_odemeTarihi = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btn_listele = new System.Windows.Forms.Button();
            this.txt_odemeNo = new System.Windows.Forms.TextBox();
            this.tc = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.cmb_odemeTuru = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_ekle
            // 
            this.btn_ekle.Location = new System.Drawing.Point(984, 478);
            this.btn_ekle.Name = "btn_ekle";
            this.btn_ekle.Size = new System.Drawing.Size(183, 36);
            this.btn_ekle.TabIndex = 41;
            this.btn_ekle.Text = "Ekle";
            this.btn_ekle.UseVisualStyleBackColor = true;
            this.btn_ekle.Click += new System.EventHandler(this.btn_ekle_Click);
            // 
            // btn_guncelle
            // 
            this.btn_guncelle.Location = new System.Drawing.Point(984, 426);
            this.btn_guncelle.Name = "btn_guncelle";
            this.btn_guncelle.Size = new System.Drawing.Size(183, 36);
            this.btn_guncelle.TabIndex = 40;
            this.btn_guncelle.Text = "Güncelle";
            this.btn_guncelle.UseVisualStyleBackColor = true;
            this.btn_guncelle.Click += new System.EventHandler(this.btn_guncelle_Click);
            // 
            // btn_sil
            // 
            this.btn_sil.Location = new System.Drawing.Point(984, 373);
            this.btn_sil.Name = "btn_sil";
            this.btn_sil.Size = new System.Drawing.Size(183, 38);
            this.btn_sil.TabIndex = 39;
            this.btn_sil.Text = "Sil";
            this.btn_sil.UseVisualStyleBackColor = true;
            this.btn_sil.Click += new System.EventHandler(this.btn_sil_Click);
            // 
            // btn_ara
            // 
            this.btn_ara.Location = new System.Drawing.Point(984, 321);
            this.btn_ara.Name = "btn_ara";
            this.btn_ara.Size = new System.Drawing.Size(183, 36);
            this.btn_ara.TabIndex = 38;
            this.btn_ara.Text = "Ara";
            this.btn_ara.UseVisualStyleBackColor = true;
            this.btn_ara.Click += new System.EventHandler(this.btn_ara_Click);
            // 
            // txt_tc
            // 
            this.txt_tc.Location = new System.Drawing.Point(984, 205);
            this.txt_tc.Name = "txt_tc";
            this.txt_tc.Size = new System.Drawing.Size(183, 28);
            this.txt_tc.TabIndex = 35;
            this.txt_tc.TextChanged += new System.EventHandler(this.txt_tc_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(843, 202);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(125, 22);
            this.label3.TabIndex = 34;
            this.label3.Text = "TC Kimlik No :";
            // 
            // soyad
            // 
            this.soyad.AutoSize = true;
            this.soyad.Location = new System.Drawing.Point(847, 108);
            this.soyad.Name = "soyad";
            this.soyad.Size = new System.Drawing.Size(121, 22);
            this.soyad.TabIndex = 32;
            this.soyad.Text = "Ödeme Türü :";
            // 
            // txt_toplamTutar
            // 
            this.txt_toplamTutar.Location = new System.Drawing.Point(984, 154);
            this.txt_toplamTutar.Name = "txt_toplamTutar";
            this.txt_toplamTutar.Size = new System.Drawing.Size(183, 28);
            this.txt_toplamTutar.TabIndex = 31;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(843, 157);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(128, 22);
            this.label5.TabIndex = 30;
            this.label5.Text = "Toplam Tutar :";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // txt_odemeTarihi
            // 
            this.txt_odemeTarihi.Location = new System.Drawing.Point(984, 58);
            this.txt_odemeTarihi.Name = "txt_odemeTarihi";
            this.txt_odemeTarihi.Size = new System.Drawing.Size(183, 28);
            this.txt_odemeTarihi.TabIndex = 29;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(839, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(129, 22);
            this.label1.TabIndex = 28;
            this.label1.Text = "Ödeme Tarihi :";
            // 
            // btn_listele
            // 
            this.btn_listele.Location = new System.Drawing.Point(984, 264);
            this.btn_listele.Name = "btn_listele";
            this.btn_listele.Size = new System.Drawing.Size(183, 43);
            this.btn_listele.TabIndex = 27;
            this.btn_listele.Text = "Listele";
            this.btn_listele.UseVisualStyleBackColor = true;
            this.btn_listele.Click += new System.EventHandler(this.btn_listele_Click);
            // 
            // txt_odemeNo
            // 
            this.txt_odemeNo.Location = new System.Drawing.Point(984, 19);
            this.txt_odemeNo.Name = "txt_odemeNo";
            this.txt_odemeNo.Size = new System.Drawing.Size(183, 28);
            this.txt_odemeNo.TabIndex = 26;
            // 
            // tc
            // 
            this.tc.AutoSize = true;
            this.tc.Location = new System.Drawing.Point(862, 19);
            this.tc.Name = "tc";
            this.tc.Size = new System.Drawing.Size(106, 22);
            this.tc.TabIndex = 25;
            this.tc.Text = "Ödeme No :";
            this.tc.Click += new System.EventHandler(this.tc_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(0, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(807, 356);
            this.dataGridView1.TabIndex = 24;
            // 
            // cmb_odemeTuru
            // 
            this.cmb_odemeTuru.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_odemeTuru.FormattingEnabled = true;
            this.cmb_odemeTuru.Location = new System.Drawing.Point(984, 108);
            this.cmb_odemeTuru.Name = "cmb_odemeTuru";
            this.cmb_odemeTuru.Size = new System.Drawing.Size(183, 30);
            this.cmb_odemeTuru.TabIndex = 42;
            this.cmb_odemeTuru.SelectedIndexChanged += new System.EventHandler(this.cmb_odemeTuru_SelectedIndexChanged);
            // 
            // Odeme
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 22F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1193, 622);
            this.Controls.Add(this.cmb_odemeTuru);
            this.Controls.Add(this.btn_ekle);
            this.Controls.Add(this.btn_guncelle);
            this.Controls.Add(this.btn_sil);
            this.Controls.Add(this.btn_ara);
            this.Controls.Add(this.txt_tc);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.soyad);
            this.Controls.Add(this.txt_toplamTutar);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txt_odemeTarihi);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_listele);
            this.Controls.Add(this.txt_odemeNo);
            this.Controls.Add(this.tc);
            this.Controls.Add(this.dataGridView1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Odeme";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Odeme";
            this.Load += new System.EventHandler(this.Odeme_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_ekle;
        private System.Windows.Forms.Button btn_guncelle;
        private System.Windows.Forms.Button btn_sil;
        private System.Windows.Forms.Button btn_ara;
        private System.Windows.Forms.TextBox txt_tc;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label soyad;
        private System.Windows.Forms.TextBox txt_toplamTutar;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txt_odemeTarihi;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_listele;
        private System.Windows.Forms.TextBox txt_odemeNo;
        private System.Windows.Forms.Label tc;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ComboBox cmb_odemeTuru;
    }
}