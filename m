Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457C84457A3
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512971; cv=none; b=pVqgz9GW+1oxYfCb7HwMIhCL6UZaI/Oql8CBn4p07Ntz9uNmlfG1ONbbl60P1QjBMPfIAIMGdmDCKgqqxzycdPPSzojNKyNvhnAk6MDgvLq6xXcliQFzIRUDyaqLCSnCuHsJOYvrQYUZl0vEz1luydkUVb1xmf2XEBmPXtOAq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512971; c=relaxed/simple;
	bh=UrR8l2e2ua0r8hL++ntP47TXScInY+OVnratMs3ND84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbYsFMFXplNIwNTZ40SePQD2KpdqEKsAGEG+tCctv9aX/axhB0ux8BuRBsNH0seaglNLCxioOFGq/IVtqVQQfHg7xpo0FiQ9sCQSKiGQ3M2qiiDM2hjkm7P/Jsrgyc3oHitkp+1cQn0bC5W5v7W/7BJXDu2uO7Sk8wOm8jp11m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAEWxMJv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAEWxMJv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so132729a91.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512968; x=1786117768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KRSCmcUKJkgpKNhWDdTfQ1+nI5nYS2/gN/zLauhACk=;
        b=cAEWxMJv5yW79pab8O+npOG66ihVGTrek77DYnok/oyfxJJH85rx5SgsBARx24iCIl
         X7z0S+tQwhrioT8Rw9nkCSmWb7Mixn0LNtZC1Cg6p8Xf/7y9pRbz8NOp3lLW8VitAs4w
         baiZQHSNoc/2YZwOXoUq9Hv3+HcaLT5IhjiDL9ls16vsEjbgS9Goaskkg/B95E9a7dw/
         WKs36trCVUYRFZC82dql4GYPOeMPypEeIeL8hZ9G+wnhamUz0wND5QGA4p9Qh2CYrVxN
         SXHuXrN8WchhPita+kd61zpis/s/m6+mWGnKlshbCtKBzbYPGDmSgUtfdFgogi6S0emD
         BI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512968; x=1786117768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KRSCmcUKJkgpKNhWDdTfQ1+nI5nYS2/gN/zLauhACk=;
        b=BzHX2Xg7TuhANG0Wx7cR2XtNWwoXIMbnbiJZoHKLRwxEBCzeOpWquOMgdOekdf0jMA
         SGtNAeqy74AmmmW3uFPSs+coWBgh5tEtOzR9iwbLKiLE7ZgSz4PHd2Wxb7e6bfAPq/rQ
         CMZvvlJrc7gaLzSqRc3HSLYXQozUt1oek+8eQv4qkXuy3zskm4ky+E5tzGJ61FBceP6B
         xIkDxxCxxDPkta1q8amdD4I5mwhMEaI7neNbehG0rmyUh1M8A6/6iEgEBgcT3ZnmXOIe
         OcfUTUE+E479H3WM1ud9GLpLUeMXkaf39oT1kYst7rIkCMbdxvSh4WG4wmQymhmHV2v3
         01Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqaXIfNV+7l6l0de9jzm2O7h24/gL9ZHRSpcLQY02AKgBJF2JxMKYrxlDJpAWNad4Mej0apOXsUKnY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8zq0wHIBnOPUqM9p+F1o1lFEdgg2FjgRU5hK/So245LQQxy3b
	soUbz7cW4y2VxtAzE8Cl9PG7Ybzx49T/jsH2oUqDqKf1dITJfVIqo9cI
X-Gm-Gg: AR+sD10068EaxDsUosFgBqZ7GJOJZsyfLhA5jHkP1P48sGAgrAh3zfSRPojVGpKUxET
	YNOLkQlAbt8KBviR4QDYxdr/aXf+HQ1qfZaytRkVTZE9852a+NNpzWrR6JnnrSMIWMCHGcxcdN7
	ZaL5YBk5adjL8TzEVQ481jkUYLjoz4EfuOMVzfCMvIxGfMUeaaxfhS1D1wbaLA897RL272mMnXK
	yW/DQj5hawD+OZv1sb11/q85yE+n0l3mGiUeICD3TgRPFcOm6Mh7qGNSJlHGv/R3fTL0B6aTKF0
	rT/dEBdZbsVPG3626wkO9DSntKWKwHZqe8c+bzy0+776SuHvGlRfDkTydee1MaVxNZVzybwBQbM
	f/u4dI34541SmpnkErQaFFL8/xBSeBOdaX2nBinuRDDya0NYVfE1szknsD10MdR31P7cKtm2zQQ
	TxobJcNMjFxDHiSq3RtY3I53E7CGn8LdmS9kMtQHoVViMPZtemIMt79I7yVg9otBf9lpxAQtu29
	FxYE9qUNfcYShg=
X-Received: by 2002:a17:90b:3a10:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-38fbc507730mr481174a91.3.1785512968287;
        Fri, 31 Jul 2026 08:49:28 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:27 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 6/8] wifi: brcmfmac: pcie: optimize latency and irq teardown
Date: Fri, 31 Jul 2026 15:48:38 +0000
Message-ID: <20260731154901.1822-7-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Optimizes mailbox polling with exponential backoff rather than a fixed
msleep(10) loop. Fixes define names. Eliminates coarse msleep(50) delays
during IRQ teardown by replacing them with tight usleep_range polling.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
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

