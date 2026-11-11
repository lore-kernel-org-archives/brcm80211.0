Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406706;
	b=Ak/McqnrlxHCHUwU0Nj0IRShMo0uB6keqfHWdag2V1Y/PZP2Pum1yIcupPNSS+wsND4J
	 9NE2ueh72AA9d6TSAkrLiIY1Ww4s3LIJICf9hIw0mCnipOcQ/UpQyI6S2JdF2+hVQ1Q0J
	 eKWcso7/T13IV6y6S+gY5JeFzOakNpcGmTSD4X+mHbdUvXN/hLs2lBMqQzsR+bc/Mqvtr
	 B+inkkAHWMIx1gDPqARqPyh91B83uKiHAP7opH/DoCg+Rf+LPsWU2B3xLhDK1Ee3o6iBL
	 a+ChNFSCcjBWIHw72n/XVpYnU+WknaV0xkTw1Rw5rkZZnzNeh1t4oLCU5Tl/gBI6Nqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8/O6pr/niEqInMXOdvInlnxxw/y/4pvajThA1RD0JII=;
	b=H5hHOmjbj7KG1FTCdwfs6hatrD1JRhiyq3U456+OFXumi0R9cd0hwqsK7LH7ZYuGMid5
	 pl9ImZBjhdYjzUZN6U0oZLf8qnhfJtv024XmYxGWlPQNrvGMqIQXDmmh5WwhSvvB93DPV
	 zJvmrrdOhxduWnTonYV+n5xd6wZ92H3ghS+es/LIbI3Jx73cJuz+wxHra2GQJ1idSsmU9
	 D2WQTATYSu7n/FOZMi/7F4ioSqDRn57XU+bLf621jYpr/Vluq3vhZQ4CsccUU7Pk/DPrz
	 viufxk0AOBMeXQlWqhn1bQaT2WbDWPA5aVGTfYkd8eYLoPGFW2fDc9BJ2y5K3wcGe8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfWqJ2Gb;
	arc=none smtp.remote-ip=91.218.175.16
Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357F606A327
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 14:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3357F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfWqJ2Gb
X-Envelope-To: brcm80211@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vbSdqpszr72dnriFcy3OhKuOoGAzGbYETYduGKXoy7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794406702; v=1; x=1795011502;
 b=QfWqJ2GbsOABvJyjR/qFBnGjWa5PZLYs4mNQERuSU9/P4bospoYjfXfSQ8pxQWxVs9aYgg9d
 JZSN+Btka8SYUlRlOfgeH8UUO+th5t+Ze+woRHDsahOu/TdRzVyC5923Y5KlJjbcotOqVCqrtrH
 8JZGCqF6OKzg4eX40Hy4WMBA=
X-Envelope-To: brcm80211@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 371126181906faca;
	Wed, 11 Nov 2026 14:18:22 +0000
X-Mizu-Trace-ID: 371126181906faca
X-Migadu-Flow: FLOW_OUT
From: Aditya Garg <aditya.garg@linux.dev>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH] wifi: brcmfmac: pcie: Make antenna SKU check optional for Apple boards with BCM4364/3
Date: Wed, 11 Nov 2026 19:47:56 +0530
Message-ID: <20261111141756.11564-1-aditya.garg@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On iMacPro1,1, iMac19,1 and iMac19,2, the Antenna SKU property required
for firmware selection is not advertised by ACPI. It has been found that
the firmware shipped by macOS for the BCM4364/3 chip is independent of
the Antenna SKU property by comparing SHA256 sums. Thus, for this chip,
make its requirement optional and use it only if ACPI advertises it.

Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
---

--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2428,39 +2428,54 @@
 	fwreq->domain_nr = pci_domain_nr(devinfo->pdev->bus) + 1;
 	fwreq->bus_nr = devinfo->pdev->bus->number;
 
-	/* Apple platforms with fancy firmware/NVRAM selection */
+	/* Apple platforms with fancy firmware/NVRAM selection.
+	 * Antenna SKU is not advertised by ACPI in iMacPro1,1,
+	 * iMac19,1 and iMac19,2. Since they use BCM4364/3, and
+	 * the firmware for that chip doesn't depend on antenna-sku,
+	 * make its check optional on that chip.
+	 */
 	if (devinfo->settings->board_type &&
-	    devinfo->settings->antenna_sku &&
+	    (devinfo->settings->antenna_sku ||
+	     (devinfo->ci->chip == BRCM_CC_4364_CHIP_ID &&
+	      devinfo->ci->chiprev == 3)) &&
 	    devinfo->otp.valid) {
 		const struct brcmf_otp_params *otp = &devinfo->otp;
 		struct device *dev = &devinfo->pdev->dev;
 		const char **bt = fwreq->board_types;
+		int i = 0;
+		int j;
 
 		brcmf_dbg(PCIE, "Apple board: %s\n",
 			  devinfo->settings->board_type);
 
 		/* Example: apple,shikoku-RASP-m-6.11-X3 */
-		bt[0] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor, otp->version,
-				       devinfo->settings->antenna_sku);
-		bt[1] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor, otp->version);
-		bt[2] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor);
-		bt[3] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module);
-		bt[4] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
-				       devinfo->settings->board_type,
-				       devinfo->settings->antenna_sku);
-		bt[5] = devinfo->settings->board_type;
+		if (devinfo->settings->antenna_sku)
+			bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s-%s",
+						 devinfo->settings->board_type,
+						 otp->module, otp->vendor, otp->version,
+						 devinfo->settings->antenna_sku);
+		else
+			brcmf_dbg(PCIE, "Antenna SKU not found\n");
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module, otp->vendor, otp->version);
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module, otp->vendor);
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module);
+		if (devinfo->settings->antenna_sku)
+			bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
+						 devinfo->settings->board_type,
+						 devinfo->settings->antenna_sku);
+		bt[i++] = devinfo->settings->board_type;
 
-		if (!bt[0] || !bt[1] || !bt[2] || !bt[3] || !bt[4]) {
-			kfree(fwreq);
-			return NULL;
+		for (j = 0; j < i - 1; j++) {
+			if (!bt[j]) {
+				kfree(fwreq);
+				return NULL;
+			}
 		}
 	} else {
 		brcmf_dbg(PCIE, "Board: %s\n", devinfo->settings->board_type);
