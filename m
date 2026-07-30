Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2646A612
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428520; cv=none; b=KpPuM6yjtxMmBpcdv6AAuqqiXID6bIMLPeDDcS0HVmfrfhgi2StCO7PF8gK42/hHd3PqSRvRzauvxRqZy02s0reUUsW5131eWImX6kCu8xmAxNLs89bYEoUQHzuJZIXCryqdsxgmYLUiYrH4NymcjV6m8XCq1f6qMphNKrc3ZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428520; c=relaxed/simple;
	bh=UrR8l2e2ua0r8hL++ntP47TXScInY+OVnratMs3ND84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5v4/y7L3fHdhU3FKHpYY9cBqIMY0rgYdB43rTIlXav9iZv7JJ/ma1fi//UKTehQqTLyHEdUTUljKYHDRIDL52Uuh3iTnZ8xEFAL1NAT60C3FJwUjs4r/wl3FoATEi6KQEenS/JUUPXAQ24xrWvV7kMN2tfQgoCrPsIduI+IZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA1S4A63; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA1S4A63"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-380f3c1b087so5445a91.3
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428518; x=1786033318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KRSCmcUKJkgpKNhWDdTfQ1+nI5nYS2/gN/zLauhACk=;
        b=UA1S4A63yDthlhdLFlSzf4rQQ5uA4heQ/DkuGJ2WUlscTEDivaU8i29Hp8IUN1/aWf
         Ka6ob4HiTGqi+5kbqe/bNI8wmQ1xpayLg6iE+v5ESAfcn30p/9iISn2+sHLmgScq6AG8
         Nx9tC00SZIJNTo60LwHpMwgk476UaDJGIeHVV72B7L29E8V34uUyOuMetFCCFTqPGylZ
         2C/ZEZvnyUbfZA2PUW6PqDxNUZ09BJworwsD+qx8MhnEf8MF/+K9Xzzn6i5ZIvn6O3aQ
         iUqx8+LWbgvfuc3lxpYbLp5hfYzdpfBZGhzqXcn8+mcUczXhYQ3dl414wDnNckiH+5Vz
         7K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428518; x=1786033318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KRSCmcUKJkgpKNhWDdTfQ1+nI5nYS2/gN/zLauhACk=;
        b=oJpxIItut4+XHFnWNmkJTnPbrIPFk9/P5JK3n8FBm/od3PoacMmVXU6MdIQEq5xsSx
         Clev2+NDRMzIPDUqtmiUyk+aO4yzt7ubnhv+PIG7L5M3gFFAQ+t2E7+gDHNgtV9+Fz50
         mgEBuoUvPhxkwbDT+tLio/zXVok0CQKKfgjEQpqNT6xB0tCBWlN14gA1wFDn1F7fOlFR
         bfpSRam9mUsYpzyHL1glYjI7x+TDYR1ud0Ww7k0K5YZNFVnNndarIIaOUnJ0zHBcsQ+P
         1E6URcE3s7iqYbI/MNSg4bCw0X0hbapPxVfDImJzI8QdSWTWxJqf+R/qsu/qwcJ4G1P8
         lbWA==
X-Forwarded-Encrypted: i=1; AHgh+RpDT7v4uH8/gjdQQSMQcWUneKFddVnWBcYmr1yQnwRkoXK17dNGYNMu5o6RHZCo7QOMxJFAs9TphxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YytWqZhzsi1jZu/PcjnjicqKKDiU1t04hds7+tckkM9uLVEY1Uo
	afZQ3vdyI5nFa3ARH+OX6XKYfc6Iia4JHvCY4jJasE7VOQ5KJmJrlVf0dfpOQ/De9Qs=
X-Gm-Gg: AR+sD10EFrmPp0uSC+PifRajK9ebr1UEHKUaeloXXiVkFW/CsMikkTiq6MLk8fK9ndX
	MvYmAmPFAUI5ss/p7wCa8uAnX29ave4Vd34eMdjzGEuwTTf9fhsS+cUouv4AaWtUPSfrNUtHiDP
	XUFUJfbgNi4fJ5C9Yt4Cn4xiy4m7rAQPTUGUEWqoHdaPhFFTqtkmUKPFtJ/n3cAfdzsesxfgUiG
	68uDwe4+90yKf9nDEu9V1thROLtKXJ9af0Z5tSri5CWXhJGRwvV+Dz+Wu6iY2XRQASBeofYTiSC
	a/6WvT6bpXxhfO4VDwleuI6MgMmfrSG6j7T9qZuAZzQ8Xqd3eqQPn+Rp87Fddxx9uJskCR3NTPA
	of7d3dTQxd9OVITu13sFIM8OkrUUJ3D35gXk7Jvqs/OIrQVqQUujOYGrLnnIbHVLjJ+4NcZrEcS
	vWGyetBPE2KtIDQ5f2w+lLafBVfDoFiTrCNHCHN8yGiVNQ7UhtVC7Tclgtf2fgI6vdUAFxGFTiG
	Io=
X-Received: by 2002:a17:90b:1dcc:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-38fa8041704mr871174a91.3.1785428517991;
        Thu, 30 Jul 2026 09:21:57 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:21:57 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 6/8] wifi: brcmfmac: pcie: optimize latency and irq teardown
Date: Thu, 30 Jul 2026 16:21:09 +0000
Message-ID: <20260730162135.12278-6-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730162135.12278-1-shivesh@example.com>
References: <20260730162135.12278-1-shivesh@example.com>
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

