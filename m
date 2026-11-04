Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805391;
	b=1X5Az6F2M+sWVJ0fDD8oZjpXskpSaVsclizlpwlkwInFtx6d7jCC25OQFFUpMgqCZ9tX
	 3DsOEl81wMRdAfzsxZwE8hsZhJRaEyaD/wfJiAu9WT13NG4MA9mNGjCx9snnF3Adzn/2/
	 4TTi1OJLqXBUeYNq5QLSLSmAWF99NvJ+rpTbK0JcmGYJg95VPmzL/bBZCMu0NtWig2dcQ
	 +Qr2u4UdvMt+V9zXAacuWLRMXbWvYm5TbgTZYDgU0yosMhkUQlc4M8x19ymT9+hj5KaSp
	 MSzWyUBk38KNnKH8nwkJCyNWQuT4Vxcxx19W2a5oLtpVzhuAeWGWUQ/keOsv5azOcQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805391;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BC2BTMGT0MonLeNLnYUzQ8CslpdJa2459jbN4UryEuY=;
	b=SB7NSde1LoLwJh84KIpRdOnPYprkyZRr27A2suFuTXtGNt9QHtLCfwaKC5d8u3jb03Rc
	 I9Hm8+MG/0DaTWf0cNeFlWhpeRlYuxAg3PibqCGSsfNLhABV4PiL8akZH22iGYSvV7fJ7
	 pxAXnAb8EldcwtjpItJjgKjKH3A4szsqMdRv2QNXM7/27zrwxUpa6YTZ5XXjeALzP65Xv
	 43eK7fReRgYb31VgNOtkiHU8Gbl4kuZ+1tsKMhxZ/J4zKkpZ6j9f1fcH+h9wx58JODzQG
	 f4VS3xSC/ptIlL3xvi2aDOO6w9jgr1S/a9NDRqOloaC1zzFFruVVllzqsY/kJygX94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uZbzD2we;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8063606EE9A
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 15:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8063606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uZbzD2we
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: f567161f-405e-4b88-98a9-490ae3628851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805389;
	bh=P+W/pFLHzJaOD2sQaIiUr8QFTt02Y7Pu/LNFlzocG2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=uZbzD2wejnwmt+sxQhFszdEdLV8jk+Y7izKkU9YHpxbwsZOvyA1UBdkIB73shZLAY
	 kQrepDqVEPs47qLGYFTHIOUdLxvC66ljFVzLaFsh8jOsUvpSH2siknwemGPaVM94wb
	 XU6aP1ytgL26/WedyOIWldTrAoOEzjA0KnWW/5rgsaaHxLYRI8+Fu5gGTRXgE9dZNk
	 OHKpoX/2DZreYphPde3aH0Cw04DG6n5pTGj5QlpO9FYlb/CpH1yPG1uFOIkg6/3No2
	 2lSGLpiifaMI5i0XKwgOCoS+nNdMP2L3vWuMqpQsHcvfitAVpP4toIlM2YMTt7/ybC
	 cbpRKKn7yXmOg==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH] wifi: brcmfmac: use a 200 ms power save timeout by default
Date: Wed,  4 Nov 2026 16:16:26 +0100
Message-ID: <20261104151626.70737-1-dev@deq.rocks>
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

cfg80211 calls set_power_mgmt with timeout -1 when userspace leaves the
dynamic power save timeout to the driver, as NetworkManager does. brcmfmac clamps that to BRCMF_PS_MAX_TIMEOUT_MS, so the firmware
stays awake for 2 s after every frame in PM_FAST mode and rarely sleeps
with the background traffic of a typical network.

Use 200 ms for -1. macOS 15.4.1 sets pm2_sleep_ret to 200 ms on the
BCM4377 of a MacBookAir9,1, seen in a trace of its iovar calls across a
sleep and wake cycle. Measured on a MacBookPro15,1, idle with WLAN
associated:

  pm2_sleep_ret 2000 ms: 11.2 W system power
  pm2_sleep_ret  200 ms:  9.2 W
  WLAN off:               8.8 W

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
The KaiT2en community runs this patch with its kernels, no regression
was reported.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d87126..e7b21703e34 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -88,6 +88,7 @@
 #define BRCMF_ND_INFO_TIMEOUT		msecs_to_jiffies(2000)
 
 #define BRCMF_PS_MAX_TIMEOUT_MS		2000
+#define BRCMF_PS_DEFAULT_TIMEOUT_MS	200
 
 /* Dump obss definitions */
 #define ACS_MSRMNT_DELAY		80
@@ -3378,6 +3379,9 @@ brcmf_cfg80211_set_power_mgmt(struct wiphy *wiphy, struct net_device *ndev,
 			bphy_err(drvr, "error (%d)\n", err);
 	}
 
+	/* cfg80211 passes -1 when userspace asks for no particular timeout */
+	if (timeout < 0)
+		timeout = BRCMF_PS_DEFAULT_TIMEOUT_MS;
 	err = brcmf_fil_iovar_int_set(ifp, "pm2_sleep_ret",
 				min_t(u32, timeout, BRCMF_PS_MAX_TIMEOUT_MS));
 	if (err)

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
