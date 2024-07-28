Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1574374FF
	for <brcm80211@lists.linux.dev>; Sun, 28 Jul 2024 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722194408; cv=none; b=RROIXk8m4TZ1e1ZhCpkC8j0Q583Zbs3+h1WlS6enG+HFsPNyTJaEiSNofY/zH2WpzLj4QGnz5UeFtEjurI1X8YWtsWugM0ypFmHIrFDtmjC2Sky2nkhs+Wiq6JYoNmUePcUR/UV0eKJsGNRcxbOX8WkDMrX377o5tJc8rYQhAB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722194408; c=relaxed/simple;
	bh=4uhY9QSQluC5veWCW52nvxW9Ot67YhwpDfMQ6BtF4yw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fHwkF76gKTwBxixMMUIh9chvYtAhmWGWO7TpLUCQk+fBHf6gQiVGOMeryObsSBjQGcXoIuWTu/m2UHqUHu+Q8FDpvh54jbQdLGB4uRsoo6LNWO46X95d1AAgTZm3vUGePonHBIGtOnNYitVTCJ/txZBl+TU3xmDjt7nZFPdzwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IgtXhGyy; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IgtXhGyy"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-65f9e25fffaso14488377b3.3
        for <brcm80211@lists.linux.dev>; Sun, 28 Jul 2024 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722194405; x=1722799205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oaGvHaFDYqYYE38Od9dSfPqzalwpWmJRDN4xycskOcI=;
        b=IgtXhGyyCG/MqZsisggdiYJOAF6nkHPqZCwjsXtU48+HBodNVKXuYChGXywm1EDLEP
         VO90grXwkCOVHXlUNYafDoN5QYFExdE6T9jMwPC3ytYb19QiSAadEbI/DCpL8Y3R8LML
         sKQi/WOYy9imnAB2jRPUrQxtDfarzFwk72Yt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722194405; x=1722799205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaGvHaFDYqYYE38Od9dSfPqzalwpWmJRDN4xycskOcI=;
        b=eRCLVKh7Zo3dwfp8ZJ8TPAKgYhiqwlfnqK/uHc6VkIiyapPqjOFdecjsw8ihQsDvZe
         5ImRIuoai9dB8HAkJzA0MNCX7drL0IxwJ1OVz85t2mtA8btl+LU+jUUwarv6RkRiIdtD
         jIhNxW/c8z/fErdXVO+b2RPhoZEYLnjUwDiDRO+V3BZ8f9EFXHtN/zflOKd5rsAAxTud
         fFtANrj8m9OxX0XbYSYC2GLLryHm861RS/+xaE/KCKzSeG7Ch8Bg62iRCyPSb7Yaoow3
         rN6zjFhGb95L+Or5qc4ht+zkdnELhMKVYoxYMblM6j58rFBb7bvvgkJrc8zKLpb7TBv9
         vGog==
X-Forwarded-Encrypted: i=1; AJvYcCVeC+JythZcZ87hUTDdF+VCugEJG9go8ar7UxaPcjlvfH7FjF6ydHqrGPm6pAdGXdn+Mgcig3Y1J3BjPB+ZfiOw8MD9QO6CiZL+
X-Gm-Message-State: AOJu0YxGB+MtkYvjiN/JMxzXHZfTFio3V30k4bqzP1/x6nNW1gc6g1QC
	ojapKi9aZCb+TCNXK9TTW6E8YCqx5H0mxV7U4eoZgoOXaYV6+kooOan6dHZIig==
X-Google-Smtp-Source: AGHT+IGC+6oypx4TeffXuzG/FKm36auS3sNNPU3SD6oSXQaE6mJoCppHpHGPsMywWnJjX4fmii6hpQ==
X-Received: by 2002:a81:a20d:0:b0:65b:cdab:2678 with SMTP id 00721157ae682-67a06a0d11cmr66592917b3.15.1722194404599;
        Sun, 28 Jul 2024 12:20:04 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead822039sm5618882b3a.110.2024.07.28.12.20.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jul 2024 12:20:04 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jacobe Zang <jacobe.zang@wesion.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT] wifi: brcmfmac: add flag for random seed during firmware download
Date: Sun, 28 Jul 2024 21:18:45 +0200
Message-Id: <20240728191845.12577-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Providing the random seed to firmware was tied to the fact that the
device has a valid OTP, which worked for some Apple chips. However,
it turns out the BCM43752 device also needs the random seed in order
to get firmware running. Suspect it is simply tied to the firmware
branch used for the device. Introducing a mechanism to allow setting
it for a device through the device table.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
Hi Jacobe,

Here is a quick patch introducing driver data table with the flag for the
random seed. So for the 43752 you would add:

@@ -2710,6 +2712,7 @@ static const struct pci_device_id
brcmf_pcie_devid_table[] = {
 BRCMF_PCIE_DEVICE(BRCM_PCIE_4366_5G_DEVICE_ID, BCA),
 BRCMF_PCIE_DEVICE(BRCM_PCIE_4371_DEVICE_ID, WCC),
 BRCMF_PCIE_DEVICE(BRCM_PCIE_43596_DEVICE_ID, CYW),
+ BRCMF_PCIE_DEVICE(BRCM_PCIE_43752_DEVICE_ID, WCC_SEED),
 BRCMF_PCIE_DEVICE(BRCM_PCIE_4377_DEVICE_ID, WCC_SEED),
 BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC_SEED),
 BRCMF_PCIE_DEVICE(BRCM_PCIE_4387_DEVICE_ID, WCC_SEED),

Please test if this works for you. If functional you may add this patch as
is in your series. Would also like to here from the Apple chip users if this
approach works for them as well.

Regards,
Arend
---
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 47 ++++++++++++++++---
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index ce482a3877e9..0ccbe2e77a0d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -353,6 +353,7 @@ struct brcmf_pciedev_info {
 			  u16 value);
 	struct brcmf_mp_device *settings;
 	struct brcmf_otp_params otp;
+	bool fwseed;
 #ifdef DEBUG
 	u32 console_interval;
 	bool console_active;
@@ -1715,14 +1716,14 @@ static int brcmf_pcie_download_fw_nvram(struct brcmf_pciedev_info *devinfo,
 		memcpy_toio(devinfo->tcm + address, nvram, nvram_len);
 		brcmf_fw_nvram_free(nvram);

-		if (devinfo->otp.valid) {
+		if (devinfo->fwseed) {
 			size_t rand_len = BRCMF_RANDOM_SEED_LENGTH;
 			struct brcmf_random_seed_footer footer = {
 				.length = cpu_to_le32(rand_len),
 				.magic = cpu_to_le32(BRCMF_RANDOM_SEED_MAGIC),
 			};

-			/* Some Apple chips/firmwares expect a buffer of random
+			/* Some chips/firmwares expect a buffer of random
 			 * data to be present before NVRAM
 			 */
 			brcmf_dbg(PCIE, "Download random seed\n");
@@ -2394,6 +2395,37 @@ static void brcmf_pcie_debugfs_create(struct device *dev)
 }
 #endif

+struct brcmf_pcie_drvdata {
+	enum brcmf_fwvendor vendor;
+	bool fw_seed;
+};
+
+enum {
+	BRCMF_DRVDATA_CYW,
+	BRCMF_DRVDATA_BCA,
+	BRCMF_DRVDATA_WCC,
+	BRCMF_DRVDATA_WCC_SEED,
+};
+
+static const struct brcmf_pcie_drvdata drvdata[] = {
+	[BRCMF_DRVDATA_CYW] = {
+		.vendor = BRCMF_FWVENDOR_CYW,
+		.fw_seed = false,
+	},
+	[BRCMF_DRVDATA_BCA] = {
+		.vendor = BRCMF_FWVENDOR_BCA,
+		.fw_seed = false,
+	}
+	[BRCMF_DRVDATA_WCC] = {
+		.vendor = BRCMF_FWVENDOR_WCC,
+		.fw_seed = false,
+	},
+	[BRCMF_DRVDATA_WCC_SEED] = {
+		.vendor = BRCMF_FWVENDOR_WCC,
+		.fw_seed = true,
+	},
+};
+
 /* Forward declaration for pci_match_id() call */
 static const struct pci_device_id brcmf_pcie_devid_table[];

@@ -2472,9 +2504,10 @@ brcmf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	bus->bus_priv.pcie = pcie_bus_dev;
 	bus->ops = &brcmf_pcie_bus_ops;
 	bus->proto_type = BRCMF_PROTO_MSGBUF;
-	bus->fwvid = id->driver_data;
 	bus->chip = devinfo->coreid;
 	bus->wowl_supported = pci_pme_capable(pdev, PCI_D3hot);
+	bus->fwvid = drvdata[id->driver_data].vendor;
+	devinfo->fwseed = drvdata[id->driver_data].fw_seed;
 	dev_set_drvdata(&pdev->dev, bus);

 	ret = brcmf_alloc(&devinfo->pdev->dev, devinfo->settings);
@@ -2667,7 +2700,7 @@ static const struct dev_pm_ops brcmf_pciedrvr_pm = {
 		BRCM_PCIE_VENDOR_ID_BROADCOM, (dev_id), \
 		(subvend), (subdev), \
 		PCI_CLASS_NETWORK_OTHER << 8, 0xffff00, \
-		BRCMF_FWVENDOR_ ## fw_vend \
+		BRCMF_DRVDATA_ ## fw_vend \
 	}

 static const struct pci_device_id brcmf_pcie_devid_table[] = {
@@ -2695,9 +2728,9 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4366_5G_DEVICE_ID, BCA),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4371_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43596_DEVICE_ID, CYW),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_4377_DEVICE_ID, WCC),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_4387_DEVICE_ID, WCC),
+	BRCMF_PCIE_DEVICE(BRCM_PCIE_4377_DEVICE_ID, WCC_SEED),
+	BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC_SEED),
+	BRCMF_PCIE_DEVICE(BRCM_PCIE_4387_DEVICE_ID, WCC_SEED),

 	{ /* end: all zeroes */ }
 };

base-commit: 338a93cf4a18c2036b567e9f613367f7a52f2511
--
2.32.0

