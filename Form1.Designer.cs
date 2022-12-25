namespace Hastane_Bilgi_Sistemi
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.tc = new System.Windows.Forms.Label();
            this.txt_tc = new System.Windows.Forms.TextBox();
            this.btn_listele = new System.Windows.Forms.Button();
            this.txt_ad = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_dogumTarihi = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txt_soyad = new System.Windows.Forms.TextBox();
            this.soyad = new System.Windows.Forms.Label();
            this.txt_telNo = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_hastaNo = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btn_ara = new System.Windows.Forms.Button();
            this.btn_sil = new System.Windows.Forms.Button();
            this.btn_guncelle = new System.Windows.Forms.Button();
            this.btn_ekle = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(-1, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(746, 356);
            this.dataGridView1.TabIndex = 0;
            // 
            // tc
            // 
            this.tc.AutoSize = true;
            this.tc.Location = new System.Drawing.Point(805, 18);
            this.tc.Name = "tc";
            this.tc.Size = new System.Drawing.Size(125, 22);
            this.tc.TabIndex = 1;
            this.tc.Text = "TC Kimlik No :";
            this.tc.Click += new System.EventHandler(this.tc_Click);
            // 
            // txt_tc
            // 
            this.txt_tc.Location = new System.Drawing.Point(936, 12);
            this.txt_tc.Name = "txt_tc";
            this.txt_tc.Size = new System.Drawing.Size(183, 28);
            this.txt_tc.TabIndex = 2;
            this.txt_tc.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // btn_listele
            // 
            this.btn_listele.Location = new System.Drawing.Point(936, 298);
            this.btn_listele.Name = "btn_listele";
            this.btn_listele.Size = new System.Drawing.Size(183, 40);
            this.btn_listele.TabIndex = 3;
            this.btn_listele.Text = "Listele";
            this.btn_listele.UseVisualStyleBackColor = true;
            this.btn_listele.Click += new System.EventHandler(this.btn_listele_Click);
            // 
            // txt_ad
            // 
            this.txt_ad.Location = new System.Drawing.Point(936, 51);
            this.txt_ad.Name = "txt_ad";
            this.txt_ad.Size = new System.Drawing.Size(183, 28);
            this.txt_ad.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(884, 57);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 22);
            this.label1.TabIndex = 4;
            this.label1.Text = "Adı :";
            // 
            // txt_dogumTarihi
            // 
            this.txt_dogumTarihi.Location = new System.Drawing.Point(936, 150);
            this.txt_dogumTarihi.Name = "txt_dogumTarihi";
            this.txt_dogumTarihi.Size = new System.Drawing.Size(183, 28);
            this.txt_dogumTarihi.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(802, 156);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(128, 22);
            this.label5.TabIndex = 12;
            this.label5.Text = "Doğum Tarihi :";
            // 
            // txt_soyad
            // 
            this.txt_soyad.Location = new System.Drawing.Point(936, 98);
            this.txt_soyad.Name = "txt_soyad";
            this.txt_soyad.Size = new System.Drawing.Size(183, 28);
            this.txt_soyad.TabIndex = 15;
            // 
            // soyad
            // 
            this.soyad.AutoSize = true;
            this.soyad.Location = new System.Drawing.Point(859, 101);
            this.soyad.Name = "soyad";
            this.soyad.Size = new System.Drawing.Size(71, 22);
            this.soyad.TabIndex = 14;
            this.soyad.Text = "Soyad :";
            this.soyad.Click += new System.EventHandler(this.label2_Click);
            // 
            // txt_telNo
            // 
            this.txt_telNo.Location = new System.Drawing.Point(936, 198);
            this.txt_telNo.Name = "txt_telNo";
            this.txt_telNo.Size = new System.Drawing.Size(183, 28);
            this.txt_telNo.TabIndex = 17;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(768, 204);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(162, 22);
            this.label3.TabIndex = 16;
            this.label3.Text = "Telefon Numarası :";
            // 
            // txt_hastaNo
            // 
            this.txt_hastaNo.Location = new System.Drawing.Point(936, 247);
            this.txt_hastaNo.Name = "txt_hastaNo";
            this.txt_hastaNo.Size = new System.Drawing.Size(183, 28);
            this.txt_hastaNo.TabIndex = 19;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(782, 247);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(148, 22);
            this.label4.TabIndex = 18;
            this.label4.Text = "Hasta Numarası :";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // btn_ara
            // 
            this.btn_ara.Location = new System.Drawing.Point(936, 356);
            this.btn_ara.Name = "btn_ara";
            this.btn_ara.Size = new System.Drawing.Size(183, 36);
            this.btn_ara.TabIndex = 20;
            this.btn_ara.Text = "Ara";
            this.btn_ara.UseVisualStyleBackColor = true;
            this.btn_ara.Click += new System.EventHandler(this.btn_ara_Click);
            // 
            // btn_sil
            // 
            this.btn_sil.Location = new System.Drawing.Point(936, 407);
            this.btn_sil.Name = "btn_sil";
            this.btn_sil.Size = new System.Drawing.Size(183, 38);
            this.btn_sil.TabIndex = 21;
            this.btn_sil.Text = "Sil";
            this.btn_sil.UseVisualStyleBackColor = true;
            this.btn_sil.Click += new System.EventHandler(this.btn_sil_Click);
            // 
            // btn_guncelle
            // 
            this.btn_guncelle.Location = new System.Drawing.Point(936, 461);
            this.btn_guncelle.Name = "btn_guncelle";
            this.btn_guncelle.Size = new System.Drawing.Size(183, 36);
            this.btn_guncelle.TabIndex = 22;
            this.btn_guncelle.Text = "Güncelle";
            this.btn_guncelle.UseVisualStyleBackColor = true;
            this.btn_guncelle.Click += new System.EventHandler(this.btn_guncelle_Click);
            // 
            // btn_ekle
            // 
            this.btn_ekle.Location = new System.Drawing.Point(936, 515);
            this.btn_ekle.Name = "btn_ekle";
            this.btn_ekle.Size = new System.Drawing.Size(183, 36);
            this.btn_ekle.TabIndex = 23;
            this.btn_ekle.Text = "Ekle";
            this.btn_ekle.UseVisualStyleBackColor = true;
            this.btn_ekle.Click += new System.EventHandler(this.btn_ekle_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 22F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1132, 577);
            this.Controls.Add(this.btn_ekle);
            this.Controls.Add(this.btn_guncelle);
            this.Controls.Add(this.btn_sil);
            this.Controls.Add(this.btn_ara);
            this.Controls.Add(this.txt_hastaNo);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txt_telNo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txt_soyad);
            this.Controls.Add(this.soyad);
            this.Controls.Add(this.txt_dogumTarihi);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txt_ad);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_listele);
            this.Controls.Add(this.txt_tc);
            this.Controls.Add(this.tc);
            this.Controls.Add(this.dataGridView1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label tc;
        private System.Windows.Forms.TextBox txt_tc;
        private System.Windows.Forms.Button btn_listele;
        private System.Windows.Forms.TextBox txt_ad;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_dogumTarihi;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txt_soyad;
        private System.Windows.Forms.Label soyad;
        private System.Windows.Forms.TextBox txt_telNo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_hastaNo;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btn_ara;
        private System.Windows.Forms.Button btn_sil;
        private System.Windows.Forms.Button btn_guncelle;
        private System.Windows.Forms.Button btn_ekle;
    }
}

