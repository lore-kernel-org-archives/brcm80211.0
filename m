Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E322468C09
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427489; cv=none; b=YdAfFWJSmMqYCHUKDzAs46IVPX6DyLAd8T2KLKjIMEcyZWf9nN8g7VepIGU4qY12nOuDsMK3QgoKhHhzItFE50aslYxvxxqvlo0ObmFnr/ANsgKMhV/kHzi5dd7XlHKoaf/scAzn8j3vFnmGl5aX+GXwhfmdbgmRzcVgjFZ+4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427489; c=relaxed/simple;
	bh=d4nOnT31foNOR63+DrFJFTVwqLjcoSlCGbUdKsH6CIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srO4c2DvGF5na031MdSMzXEIHxrwjqH3fo5Q+kbDj/XwcmM0OvB+eUw6zcganNV+ov2HOmt5uMgJCbWyrq8uiK7HiN87ybGPIQ27WdBJc/iDIfTOCjg17HjOD+damg/t1nC7GtSHdDzjCWutkX0qfs5ujUo2FjP1c53ro5vnPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRuEroNl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRuEroNl"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca6bda96134so159561a12.3
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427488; x=1786032288; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYPgSDDfqeqUZ3RR4zRVMJgkhHA+lOjtpoEJpFazOss=;
        b=TRuEroNlsv/9PiSBbhFhOOwMefQqB/SirYOOPm2b7WAd6jWPZsmZUXG2NsxozbyiZ1
         pQFcSR7JRfrQv9cBx8A3DvH1jIQHDVvL4GCgSjExVqFIqCEKsIYGpRsPvJp/mQGHHEyX
         LUXgca/t38RiJc0eSgdmEkEBstHnWKWK7D1XE+IQ36kGNBSfA2ekZ3HVU+WOvWlgqXtU
         vWndH5HxNM+aWFGtHN+jXfO8UBWcc46QZsxXQ9eo3dWUzuHKHBy8yDGjQt/e/O+K/ZlJ
         EoSoIHfkrSOERakj2K9nKjQWY1LPZxgEYszHkMS1IWnsQFfdgWhEezkxTc6DWkUd2ruc
         6XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427488; x=1786032288;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYPgSDDfqeqUZ3RR4zRVMJgkhHA+lOjtpoEJpFazOss=;
        b=siZUp+uwYPWHSvpsi/S7yqzD0GPkgy3nM3ljg18yiUwoDtH4ZGG0xqn7oR0KO/RqXZ
         er/xh47mlBPz+ZjHccb1oQdoZDcbbR+uIivIfKmTQN0GHFGG4RjAJ7kXGr8W+5VvwCkX
         hUJbsQosimPdLTyQmom1KFZ0dBRpY1BP9Fw0VXTec8IZIGL24ysmuQubJEG8Tj6OdUg+
         Gtt5NkNHXOHyU3Zc9AYQlsRjq7xFndk76uczxD/vFjtuWSOSrOUEA5HDWwkbE2WHzoyL
         yHvajDeQo7PDxzJzjNd98GAyUzkfY29mjQ5NgAjaXEJHN3La3Vy9uXkB+LeL9Bp42usN
         cbKw==
X-Forwarded-Encrypted: i=1; AHgh+RrCw4i2hILRZ00ut5B0ART+zKyjVqkoMGjAiZF56EzU3IJ87DlG11eb3hPFo9Wxx/Kk3F8CFkDsmic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6wMU3MZEivTHHCI57nrgpPepXFichulTHXhoeWTm4t9DEuwNs
	PVFmvTPLJR1mUexFMR5cP8P56qVAxV5GrJRYrgQXludMfTc88HoM32Yq
X-Gm-Gg: AR+sD12f4SlziF6s63BBlk8t9DK0f5134/98PEXh7VMSIGTWzmL1Lnwo5yvB3igjQrB
	vui3HiAEsdSGzD8qkna61lgpZMsUY+qiagBPn4i6fsUmLfVTciArpV0CEbyuu3xUr6T2dCAwcN5
	ztz9xDit0nkYtfqZKaC40DL+5yJvBdlWeeGjBUf43QmyLamfdIQ7nwXp1xTyygR7C82GdNZ3l4F
	QbYyOEx4z5NrZWhefTIVPvAiXRiakr+s8/lkiIMTJ8mM8a+vsqdd4sKy0qBp/PvhJewxxAV2Aol
	w7lzxBDvDaMsvsKZAtcKLNRFsYRnOVHxGDiA4f7XrbXULS/SMblIZjhuqczokKyWRBu9Bd6OpNv
	EFBwduFX5O+I+g/u4UAnyuDf77lGx+gIr344HbjX5xsXlbboSpK6fNiofzgR+xMSR7XGmcvcFn7
	2t9VoIMFFilXT7sY71Qn/WZLa4QI8oISws7PdIg0RRgPk/WL0TL0kJisqV4RfgbeTeHFg6ac3UQ
	BzJubE+7fw+2g==
X-Received: by 2002:a17:90b:5784:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-38fa7fe2179mr773181a91.2.1785427487341;
        Thu, 30 Jul 2026 09:04:47 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:46 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 6/8] wifi: brcmfmac: pcie: optimize latency and irq teardown
Date: Thu, 30 Jul 2026 16:03:54 +0000
Message-ID: <20260730160425.11933-6-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Optimizes mailbox polling with exponential backoff rather than a fixed
msleep(10) loop. Fixes define names. Eliminates coarse msleep(50) delays
during IRQ teardown by replacing them with tight usleep_range polling.

Signed-off-by: Shivesh <shivesh@example.com>
---
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 66 ++++++++++++++++---
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 13662aa4b4ea..9338a5faa260 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -268,6 +268,27 @@ static const struct brcmf_firmware_mapping brcmf_pcie_fwnames[] = {
 
 #define BRCMF_PCIE_MBDATA_TIMEOUT		msecs_to_jiffies(2000)
 
+/*
+ * H2D mailbox poll timing parameters.
+ *
+ * The dongle typically clears the H2D mailbox register within a few
+ * hundred microseconds after the doorbell interrupt fires.  The
+ * original code used msleep(10) * 100 iterations, meaning the
+ * minimum observable latency was 10ms even when the dongle was fast.
+ *
+ * We instead start with a short sleep and double it each iteration
+ * (exponential backoff) up to BRCMF_PCIE_MB_POLL_MAX_US, staying
+ * within the same 1-second absolute timeout.
+ *
+ * MIN_US / INITIAL_MAX_US : usleep_range bounds for the first iteration.
+ * MAX_US     : cap on the per-iteration sleep (µs).
+ * TIMEOUT_US : total budget before giving up (1 second).
+ */
+#define BRCMF_PCIE_MB_POLL_MIN_US		40
+#define BRCMF_PCIE_MB_POLL_INITIAL_MAX_US	50
+#define BRCMF_PCIE_MB_POLL_MAX_US		5000
+#define BRCMF_PCIE_MB_POLL_TIMEOUT_US		1000000
+
 #define BRCMF_PCIE_CFGREG_STATUS_CMD		0x4
 #define BRCMF_PCIE_CFGREG_PM_CSR		0x4C
 #define BRCMF_PCIE_CFGREG_MSI_CAP		0x58
@@ -766,7 +787,8 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)
 	struct brcmf_core *core;
 	u32 addr;
 	u32 cur_htod_mb_data;
-	u32 i;
+	u32 elapsed_us = 0;
+	u32 sleep_us = BRCMF_PCIE_MB_POLL_INITIAL_MAX_US;
 
 	shared = &devinfo->shared;
 	addr = shared->htod_mb_data_addr;
@@ -776,12 +798,40 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)
 		brcmf_dbg(PCIE, "MB transaction is already pending 0x%04x\n",
 			  cur_htod_mb_data);
 
-	i = 0;
+	/*
+	 * Wait for the dongle to consume the previous H2D mailbox message.
+	 *
+	 * There is no interrupt that signals when the dongle clears this
+	 * register, so polling is unavoidable.  The original code used
+	 * msleep(10) per iteration, incurring at least 10ms of latency
+	 * even when the dongle responded in microseconds.
+	 *
+	 * We use usleep_range() with exponential backoff instead:
+	 *   - First iteration sleeps ~50µs (fast path for responsive dongle).
+	 *   - Each subsequent iteration doubles the sleep, capped at 5ms,
+	 *     so long waits still yield the CPU without busy-spinning.
+	 *   - Total timeout matches the original 1-second limit.
+	 *   - We bail early if the device has gone down so that a dead
+	 *     dongle does not hold the caller for a full second.
+	 */
 	while (cur_htod_mb_data != 0) {
-		msleep(10);
-		i++;
-		if (i > 100)
+		if (devinfo->state == BRCMFMAC_PCIE_STATE_DOWN) {
+			brcmf_dbg(PCIE, "Device down, aborting MB send\n");
 			return -EIO;
+		}
+
+		if (elapsed_us >= BRCMF_PCIE_MB_POLL_TIMEOUT_US) {
+			brcmf_err("Timeout waiting for H2D MB slot after %u us\n",
+				  elapsed_us);
+			return -EIO;
+		}
+
+		usleep_range(BRCMF_PCIE_MB_POLL_MIN_US, sleep_us);
+		elapsed_us += sleep_us;
+
+		/* Exponential backoff, capped at BRCMF_PCIE_MB_POLL_MAX_US */
+		sleep_us = min(sleep_us * 2, (u32)BRCMF_PCIE_MB_POLL_MAX_US);
+
 		cur_htod_mb_data = brcmf_pcie_read_tcm32(devinfo, addr);
 	}
 
@@ -1001,10 +1051,10 @@ static void brcmf_pcie_release_irq(struct brcmf_pciedev_info *devinfo)
 	free_irq(pdev->irq, devinfo);
 	pci_disable_msi(pdev);
 
-	msleep(50);
+	usleep_range(1000, 2000);
 	count = 0;
-	while ((devinfo->in_irq) && (count < 20)) {
-		msleep(50);
+	while ((devinfo->in_irq) && (count < 1000)) {
+		usleep_range(1000, 2000);
 		count++;
 	}
 	if (devinfo->in_irq)
-- 
2.53.0

