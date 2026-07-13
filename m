Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109173CF661
	for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932663; cv=none; b=BOhFJAu7fllvYeRYxyMfO3xjctzVrOrCJ2NG7CxP2AxZZH+5vLEPQfi3VOOdI40jz+HJWAWI1QiT6xexApUun3A2a7eANfmZvDJJW2tZWFGQS2MSzgWFDxop1AI55/g2kpVZjtwvdPnTxgdZdGP4blS+jd43C1Vp72g1AtCu8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932663; c=relaxed/simple;
	bh=x2y7A0mQWDqx9SWlyeRZiEZyZuZoqGFvVUSn6KvNwf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ateits8Emc2pxjOocYqkHRiyzopxESejH9h9ahNQUEbimm5pONyAl9WkO0QyTDAuDdocUQ1p3aZVPEpgE8Cm5NybkCAq0QyppZCDUq7dxRXkmUnIQ5wfmr3fdDV8hi7RHhkzAXZ9K+R06moriCnAuUAb+8Umi9f1pmi9dqVUzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxXZr/Yq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxXZr/Yq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7cfa17fedso40515745ad.3
        for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783932660; x=1784537460; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tx9/pVLn3lgrECS5JH9ovCKH0knPJW11H9lumC0dnr4=;
        b=XxXZr/Yq/C1lB6ggqPZnE1SzEnAOxetU88fl1BbHdQuOQT79ta7m0xLjAZMzyDMkkf
         ixskO2pupZry7gpe61v/6YTWN+kMCCM3dhfqnYc77f5FrTMf9UbSSaOQc8esSPTB/9jY
         8klhdxey4wDYPph3Z055uV0FLLV/Q/tJ2Yht959Jalr8IWST2PJ0o2VQXQzOWXRNwLgN
         YzhZTe3wOFDCMoDFjphxmVV1NZJXieH5LEA/c24ewGsWEtAilOD++MPc4k+pJLFzM5nN
         MAdA51xsZwX3jWnVtIEP1OJz/diiF+3e0CbUDE1hAIIMZAO19js6vxN9qe5Cm/53vjnW
         jn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932660; x=1784537460;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tx9/pVLn3lgrECS5JH9ovCKH0knPJW11H9lumC0dnr4=;
        b=YbRhCGLxwfm+ZLNocfeD4WoX6a9rCW1n3DWCet70b4WLVlTQxUGedFo9bqlEDocAJv
         IAlkqn38PemL+XvPQBHBPh/RX6MyQ3ryJAUNCLABXZVZdx5+FwTaqkMsN0Pp4EUOv4HU
         AR7Ble2IAv1xzaliwTWgN+xz8UQa3w6YJtrTyyWYscxwCwLpC4/lpsnFDIn+Civdwt3c
         5YI+t5NoSuisCJ7bLHa1h2tx+zOCI84dafCIhBeJS6iuwW194P0gA6PEuLTy2Vo1f1R0
         ibE8ef4DZZafxgnncakdTBTLd7bj0qxiYU77YsTGrBy5mo2lDoQe1v4n9/xGl/Zm1Pq/
         9E+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5CuurqwMYTgAKCdCvAgRzepf3Bk1bCdQyqb8JwV3Z88TmxFZngZaJVO5POGQ0kObECCBNPcIX6i0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS9/KWLYQSDT86ItIocpapUAOEHtJczMSzQby/WiLTkw4Us0Jp
	kD7H2ya7tB6D6ljbZ0/rvOY2UBzQSOofesfjgBoQTX2E+TmxjdkDGcHy
X-Gm-Gg: AfdE7clBILM2nHCd/rq5HIw0Qj/IPQ+GZ4o90XyX0TT9xWWls2N98ezqx51ZZACD3bW
	d3u2Snip08KHToONS5NYNzrZwfWsYXy8G+GY9fCq6aJYcaTIjczXQ/01vUcqs/MHEfMJQe54yd/
	GUP2B8AJbOQQvz0NfXhJmEb2vkgPH8Ym8sDjbJyfgm6JlcHc2vXQa0OpXLndZ99hlCE4JPResT0
	tBMscTBmrd54FIr6ENhfsXjyLly4oy0SLYDsgkJ0Dj3S4ipoNxPknUX6NFB8k92J/I/+FOwscrv
	AAjlt9iU9EmzZdk600aa+Rm+aDkGW21VCG0uDhWte/RWv2vS3gelRZa45c3vd6fyfCJMTSlNwmN
	pvFWYkolvm4qxD1IWh0ME9jkEkRPprmami7/zsUkqsRcAstB7HYdfNl28SwDmaNJy2tFj2DZkHs
	G5lb/syseTckmsiudijB6XUMylo+poO2RagcGE3UCWVHVieYBJcpt6n7yOloWVsJBYB0Z0oBO2
X-Received: by 2002:a17:903:b85:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ce9e9a6ed8mr68713635ad.2.1783932660354;
        Mon, 13 Jul 2026 01:51:00 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5c804sm95405245ad.82.2026.07.13.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:50:59 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 13 Jul 2026 16:50:55 +0800
Subject: [PATCH] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO6mVGoC/x3MSw5AMBRG4a3IHbuJth5hK2KA/uWGIG0iQuxdY
 /gNznkowAsCNclDHqcE2bcIlSY0zv02gcVGk850mVXK8JCbqtDsNA/rEm6Gs72yMLCoKVaHh5P
 rP7bd+34mYVoyYQAAAA==
X-Change-ID: 20260713-b43752-f2-blksz-efda1de3ede9
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Kalle Valo <kvalo@kernel.org>, Angus Ainslie <angus@akkea.ca>
Cc: Wig Cheng <onlywig@gmail.com>, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783932657; l=3337;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=x2y7A0mQWDqx9SWlyeRZiEZyZuZoqGFvVUSn6KvNwf4=;
 b=BriQddfQajmgnCw8Aakdagw3LVvgLsP2Zq4g4TFKQomiuHfkR5bWjOjAThxzIfHyPUU1TxUVM
 t2+MK21tqSSD+w1LXqhx2T2x3OK4/z1eBGVRXDEceDDkHThoe2UzDaP
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The BCM43752 is not reliable with the default 512-byte SDIO function 2
block size: on an i.MX8MP board with an AMPAK AP6275S module at
SDR104 / 200 MHz, an iperf TX stress test kills WLAN within seconds:

  mmc_submit_one: CMD53 sg block write failed -84
  brcmf_sdio_dpc: failed backplane access over SDIO, halting operation

Commit d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
set up the 43752 like the 4373 for the F2 watermark but missed the F2
block size, which the 4373 limits to 256 bytes. The vendor driver
(bcmdhd) also programs a 256-byte F2 block size for this chip and runs
the same hardware without errors.

Group the 43752 with the 4373, matching the F2 watermark handling.
With this change a 10-minute bidirectional iperf3 soak completes with
zero SDIO errors at ~270 Mbit/s in each direction.

Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
Cc: stable@vger.kernel.org # <= 6.16 needs the CYPRESS_43752 id name
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
The failure was isolated by testing combinations of scatter-gather
support and F2 block size, all at SDR104 / 200 MHz, with an iperf
multi-stream stress test plus a 5-10 minute bidirectional iperf3 soak:

  sg/glom  F2 blksz  result
  on       512       fatal halt within seconds (CMD53 write -84,
                     "failed backplane access", wlan dead)
  txglom off, 512    survives, but ~14 recoverable CMD53 errors/min
  rx glom on
  off      512       firmware PSM watchdog reset after ~3 minutes
  off      256       0 errors, but TX limited to ~142 Mbit/s
  on       256       0 errors, RX 265 / TX 273 Mbit/s (this patch)

So the corruption tracks the 512-byte block size, not scatter-gather;
glomming only amplifies it. The vendor bcmdhd driver logging "set
sd_f2_blocksize 256" at probe is what pointed at the missing override.

The BCM43751 shares the 43752 firmware handling and F2 watermark case
and may need the same fix, but I have no 43751 hardware to verify.

Tested on:
- i.MX8MP (usdhc SDIO host, AMPAK AP6275S module) with Linux kernel
  6.12.34 plus this patch

The touched code is unchanged between 6.12 and the current tree apart
from the 74e2ef72bd4b ("wifi: brcmfmac: fix 43752 SDIO FWVID
incorrectly labelled as Cypress (CYW)") rename; stable trees before it
need the old SDIO_DEVICE_ID_BROADCOM_CYPRESS_43752 name to build.
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index d24b80e492e084160e1d085b8c20242de3e07c28..3f7a05c4d27ad4c284a6ecc7f0b014a1e985526d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -911,6 +911,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev *sdiodev)
 		return ret;
 	}
 	switch (sdiodev->func2->device) {
+	case SDIO_DEVICE_ID_BROADCOM_43752:
 	case SDIO_DEVICE_ID_BROADCOM_CYPRESS_4373:
 		f2_blksz = SDIO_4373_FUNC2_BLOCKSIZE;
 		break;

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-b43752-f2-blksz-efda1de3ede9

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

