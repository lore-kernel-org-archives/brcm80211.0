Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EE1DE4EF
	for <brcm80211@lists.linux.dev>; Wed,  6 Nov 2024 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730912847; cv=none; b=OP7+ZZ25hHe5iSmEmBXBYN36G9sHDGUQdyFd6sgnnXz8Jz9Si9qVOtQP4DPEuW2ujf/ZRl1DKmFW0hwYQ/22deh+t9xJF0+BmKWWfktxdTjebsTA7EXcYwTrWww55sLXGqTQlQLhTZf5/4uiMsrx2659mTTMkl12XYfBcI6VbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730912847; c=relaxed/simple;
	bh=KMwi4wYhZdlHLCX2G2Q9HUhUPG50WPecsWOZ3KoLi9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zico395OSdn0r/7bidKF0Mn//G+OuGxrASFd3DQoim5aYbNFJrLUA/0noZuYSaa1OXWPZp1eGG9qMPB5IsbjnqN3PNTYOvCxc7a2D3dzfYCjIMNx3lQJ4GgkV9sR3ivChiM4OHs0xvyAqkv5Jhc0q+h6m66tr7fqRxlCT9xElKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=psuLRUGY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="psuLRUGY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so10910644e87.2
        for <brcm80211@lists.linux.dev>; Wed, 06 Nov 2024 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730912842; x=1731517642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHM9QeNlhOTneChj4bKhI5LC9ZZcmDxqXuZBfNBpX+4=;
        b=psuLRUGYQi5gA6B/4mjXE3Pc2hfRdOHuoSYvVpzHtdfrQSfdOhYdECpJRoWI7ckpX7
         kB7mzWxeri3vwWh77hULGwKlLSLFew9nWXGp9LWtRjS1quBTZ/twgRM3OQFe6/XFTKSp
         mO11Z+Iko6ZnG5a7FRI9mNIkEbhnYLwFSV3sUyS/DE96HfWEpWdlvJ3EresUnX/mWCxj
         /6s4A9dHOpt0bbnlUJwdOwxnbiq1spgtcNS1c/cSRDkOAWO7RKhLVR+oG1V/W9r6tdKd
         QySLYogAHZzv/+7vpqsiFs4sZ8dqxtdMuGjc936wuanjhplNO7GYTSTar5Gcw9bdNYnN
         RQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912842; x=1731517642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHM9QeNlhOTneChj4bKhI5LC9ZZcmDxqXuZBfNBpX+4=;
        b=FJk6odxUV8SNXglQtuTdcnfd9vUZQcK800Bk5hTvBDybFLsVPa4zW4uQ6ayzPgPudj
         H0fXy1Wst+F1yVU6Hszevia6OAf83MpCINVyMjDAdy80+zIDW2Guv5FkZfzwG+n/knr4
         MowWbIjZz9TvQflkdw/TaxpXf7o5pd694b2J3oTWIphbPMia6n7Wkk+9g7Is5Uwj0VTn
         q96OHh0XUZoTe4Jj7cwvAdkho/dN2UtUMQbqKyZt4/vdwz8ip7J1kVMHKRocxlJqwDNr
         dit8wKYVa5kgtQzmLQrXoG75xYM0bt+gsk3jfgFCryLjzOtlqXl0Wx1xU30+noefm1ww
         9ZOA==
X-Forwarded-Encrypted: i=1; AJvYcCWv5W8qKH8x96gnNBJdmZHo9jC5LGBsP3poNldB/GrIqS9upB+j8YxhG9G+KQuCTyKj/Zz+AJihga4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLlhPM6mSRL6iU0rVo0UFer/cR7wp/pZV4GKhSq7gGiH12JEc/
	dtb2gzET8aj/udifszZPXt6hIQmuWShiRcjqa82jHdMKx6HS+16kQrqr27e9H5g=
X-Google-Smtp-Source: AGHT+IGhBvl6PJej/erZYenNszqbzeKKntvkwDvg4ctncTyHT7L1mvB9FrEIevg7TtOD7POmTVj7AQ==
X-Received: by 2002:a05:6512:e9b:b0:535:6951:9e1c with SMTP id 2adb3069b0e04-53d65de3305mr15940463e87.15.1730912841533;
        Wed, 06 Nov 2024 09:07:21 -0800 (PST)
Received: from localhost (p200300f65f28bb0063ffae39110fa2df.dip0.t-ipconnect.de. [2003:f6:5f28:bb00:63ff:ae39:110f:a2df])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16daf14sm303710566b.80.2024.11.06.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:07:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Loic Poulain <loic.poulain@linaro.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Breno Leitao <leitao@debian.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	wcn36xx@lists.infradead.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: Switch back to struct platform_driver::remove()
Date: Wed,  6 Nov 2024 18:07:06 +0100
Message-ID: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9551; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KMwi4wYhZdlHLCX2G2Q9HUhUPG50WPecsWOZ3KoLi9k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnK6I7k3QwBHx4LDlthAT30A0zDc9WSJ6yBQ3NF 4O0KVmRJ9aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyuiOwAKCRCPgPtYfRL+ ThLbB/wNHseXuNO6BSs0X7tJr80GSCYLop1HgRzFN6qlnsLebiHcY7/fxrQIk4qvEabG2PB6fW1 7hZIqip47uQZYg+b+djnq7b1LAvKA+1hMzBs2MDcmIZbgfVtcmbBPt3UbZDo8krGzBj80RcVoJ7 3glArVF/Hp0VNmM+6IWIzxLKKWUr5lEPQk2lUPBd/9O8pbSrizA4gRnMP2Rif6goEFsYwWDgmZF yOTyIGlVcWgm86js57VuSJ+x+ys3kUiz2O67dCQEQiXLzRlCFyi7TKysdToW9E/jMTucq28WmUh J1zg5EM/JY/sa9jMUt7vzYlpMFHU8LP1xFH7gzizoH34q0Ts
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/net/wireless to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

En passant several whitespace changes are done to make indentation
consistent in the struct initializers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/net/wireless. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Also if you object the
indentation stuff, I can rework that.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/net/wireless/ath/ath10k/ahb.c                  |  8 ++++----
 drivers/net/wireless/ath/ath10k/snoc.c                 |  6 +++---
 drivers/net/wireless/ath/ath11k/ahb.c                  |  8 ++++----
 drivers/net/wireless/ath/ath5k/ahb.c                   |  8 ++++----
 drivers/net/wireless/ath/ath9k/ahb.c                   | 10 +++++-----
 drivers/net/wireless/ath/wcn36xx/main.c                |  8 ++++----
 .../net/wireless/broadcom/brcm80211/brcmfmac/common.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/soc.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c        |  2 +-
 drivers/net/wireless/ti/wl12xx/main.c                  |  2 +-
 drivers/net/wireless/ti/wl18xx/main.c                  |  4 ++--
 12 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index f0441b3d7dcb..db9f9ebcb62d 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -837,12 +837,12 @@ static void ath10k_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath10k_ahb_driver = {
-	.driver         = {
-		.name   = "ath10k_ahb",
+	.driver = {
+		.name = "ath10k_ahb",
 		.of_match_table = ath10k_ahb_of_match,
 	},
-	.probe  = ath10k_ahb_probe,
-	.remove_new = ath10k_ahb_remove,
+	.probe = ath10k_ahb_probe,
+	.remove = ath10k_ahb_remove,
 };
 
 int ath10k_ahb_init(void)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 0fe47d51013c..d436a874cd5a 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1885,11 +1885,11 @@ static void ath10k_snoc_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver ath10k_snoc_driver = {
-	.probe  = ath10k_snoc_probe,
-	.remove_new = ath10k_snoc_remove,
+	.probe = ath10k_snoc_probe,
+	.remove = ath10k_snoc_remove,
 	.shutdown = ath10k_snoc_shutdown,
 	.driver = {
-		.name   = "ath10k_snoc",
+		.name = "ath10k_snoc",
 		.of_match_table = ath10k_snoc_dt_match,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 916402ad06b8..f2fc04596d48 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1313,12 +1313,12 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver ath11k_ahb_driver = {
-	.driver         = {
-		.name   = "ath11k",
+	.driver = {
+		.name = "ath11k",
 		.of_match_table = ath11k_ahb_of_match,
 	},
-	.probe  = ath11k_ahb_probe,
-	.remove_new = ath11k_ahb_remove,
+	.probe = ath11k_ahb_probe,
+	.remove = ath11k_ahb_remove,
 	.shutdown = ath11k_ahb_shutdown,
 };
 
diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
index f27308ccb2f1..cb3e891ee1bd 100644
--- a/drivers/net/wireless/ath/ath5k/ahb.c
+++ b/drivers/net/wireless/ath/ath5k/ahb.c
@@ -218,10 +218,10 @@ static void ath_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath_ahb_driver = {
-	.probe      = ath_ahb_probe,
-	.remove_new = ath_ahb_remove,
-	.driver		= {
-		.name	= "ar231x-wmac",
+	.probe = ath_ahb_probe,
+	.remove = ath_ahb_remove,
+	.driver = {
+		.name = "ar231x-wmac",
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath9k/ahb.c b/drivers/net/wireless/ath/ath9k/ahb.c
index 1a6697b6e3b4..d4805e02b927 100644
--- a/drivers/net/wireless/ath/ath9k/ahb.c
+++ b/drivers/net/wireless/ath/ath9k/ahb.c
@@ -158,12 +158,12 @@ static void ath_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath_ahb_driver = {
-	.probe      = ath_ahb_probe,
-	.remove_new = ath_ahb_remove,
-	.driver		= {
-		.name	= "ath9k",
+	.probe = ath_ahb_probe,
+	.remove = ath_ahb_remove,
+	.driver = {
+		.name = "ath9k",
 	},
-	.id_table    = ath9k_platform_id_table,
+	.id_table = ath9k_platform_id_table,
 };
 
 MODULE_DEVICE_TABLE(platform, ath9k_platform_id_table);
diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 408776562a7e..8557d4826a46 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1679,10 +1679,10 @@ static const struct of_device_id wcn36xx_of_match[] = {
 MODULE_DEVICE_TABLE(of, wcn36xx_of_match);
 
 static struct platform_driver wcn36xx_driver = {
-	.probe      = wcn36xx_probe,
-	.remove_new = wcn36xx_remove,
-	.driver         = {
-		.name   = "wcn36xx",
+	.probe = wcn36xx_probe,
+	.remove = wcn36xx_remove,
+	.driver = {
+		.name = "wcn36xx",
 		.of_match_table = wcn36xx_of_match,
 	},
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 58d50918dd17..cfcf01eb0daa 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -594,7 +594,7 @@ static void brcmf_common_pd_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver brcmf_pd = {
-	.remove_new	= brcmf_common_pd_remove,
+	.remove		= brcmf_common_pd_remove,
 	.driver		= {
 		.name	= BRCMFMAC_PDATA_NAME,
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
index ec02148a7f1f..08590aa68356 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
@@ -71,7 +71,7 @@ MODULE_FIRMWARE(MT7628_FIRMWARE_E2);
 
 struct platform_driver mt76_wmac_driver = {
 	.probe		= mt76_wmac_probe,
-	.remove_new	= mt76_wmac_remove,
+	.remove		= mt76_wmac_remove,
 	.driver = {
 		.name = "mt76_wmac",
 		.of_match_table = of_wmac_match,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
index 12e3e4a91d27..06a0f2a141e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
@@ -63,7 +63,7 @@ struct platform_driver mt7622_wmac_driver = {
 		.of_match_table = mt7622_wmac_of_match,
 	},
 	.probe = mt7622_wmac_probe,
-	.remove_new = mt7622_wmac_remove,
+	.remove = mt7622_wmac_remove,
 };
 
 MODULE_FIRMWARE(MT7622_FIRMWARE_N9);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 90a6f61d1089..c823a7554a3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1303,7 +1303,7 @@ struct platform_driver mt798x_wmac_driver = {
 		.of_match_table = mt798x_wmac_of_match,
 	},
 	.probe = mt798x_wmac_probe,
-	.remove_new = mt798x_wmac_remove,
+	.remove = mt798x_wmac_remove,
 };
 
 MODULE_FIRMWARE(MT7986_FIRMWARE_WA);
diff --git a/drivers/net/wireless/ti/wl12xx/main.c b/drivers/net/wireless/ti/wl12xx/main.c
index b26d42b4e3cc..ffbf54776330 100644
--- a/drivers/net/wireless/ti/wl12xx/main.c
+++ b/drivers/net/wireless/ti/wl12xx/main.c
@@ -1939,7 +1939,7 @@ MODULE_DEVICE_TABLE(platform, wl12xx_id_table);
 
 static struct platform_driver wl12xx_driver = {
 	.probe		= wl12xx_probe,
-	.remove_new	= wl12xx_remove,
+	.remove		= wl12xx_remove,
 	.id_table	= wl12xx_id_table,
 	.driver = {
 		.name	= "wl12xx_driver",
diff --git a/drivers/net/wireless/ti/wl18xx/main.c b/drivers/net/wireless/ti/wl18xx/main.c
index 39d8eebb9b6e..4be1110bac88 100644
--- a/drivers/net/wireless/ti/wl18xx/main.c
+++ b/drivers/net/wireless/ti/wl18xx/main.c
@@ -2097,9 +2097,9 @@ MODULE_DEVICE_TABLE(platform, wl18xx_id_table);
 
 static struct platform_driver wl18xx_driver = {
 	.probe		= wl18xx_probe,
-	.remove_new	= wlcore_remove,
+	.remove		= wlcore_remove,
 	.id_table	= wl18xx_id_table,
-	.driver = {
+	.driver		= {
 		.name	= "wl18xx_driver",
 	}
 };

base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
-- 
2.45.2

