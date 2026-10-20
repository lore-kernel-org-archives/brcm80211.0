Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528793;
	b=0k3THbGKT/5B8Sgtvswmm08yTUpV8iu4bU0dje38zX+71D3ef3byyyfqppjmFQ4X23Jp
	 czo/ySawKhk77uY6FLtNl9LR+4OlrKYzMUDN2wSRdT0s57IzLR75dQd03xC0rJSJXXRR3
	 ZfR00Uw7+74PnipHgh4sy+hSjYmKphP6s5NHRDFEIr80wS5E4N8ID9yEsJMC9l/Og24MM
	 drjajEmUDF9Z9Tld1zUwaE9YO8GzYwrbwy06mV2FD7d6CG3S6CyNR8geWC9HgaOJvAYnU
	 k7BxCdkO2kzKkw2w63NlIyRwFLONsST4OXPIr8pui3ZAHqMYAB3CbwHbkNEj5n7CsCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
	b=18XjYEf+n5SBWfKDLFnuX2TJVW2g3ClbydSqcF++m5AvTEdBMUguaHhKbk5TeSWGtiOV
	 Sm+WJZaixSPPjpjPNG7c4XfbgNlTyGfKiIkbBCm2drU1NZzL3GWUUJvn3vDGD6+P2MweR
	 ZDsf8Cv/zfZ78JyulYbLHj+/+Mjd/Le/gl+GYpGWv3nGoqYPkM9xKWWas7oo05nXaaVOm
	 gdTlw+wzUnK9fq/sdYmV1uQDHA0lrlZcNT1NTYS0qawrUUIz3lsxIYj50pRnX2IrvUuQi
	 vUcead2lLHsr9psl9do8rEiqXZimZe+NEr4q0QdXcja9fa5yvB36wzOIIngZWdprdDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A0ixEpBF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545A606A319
	for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 20:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2545A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A0ixEpBF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so62275e9.1
        for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 13:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528791; x=1793133591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
        b=A0ixEpBFs5x97Ft89uYnHnZkfm0Ngzjfvlu3TSpl4LMBY78PjXdP+hYIDKutFxEEoq
         Mgx8ep9FQd9S+21L3bFVj8AkzWIghSTttcHggAcraBNT8c/cB7j3cgSY/cJ2AsBOJ6ka
         +sISJ+wovRvgpjyvAblo+kUgboJJJyBqZKO+TqpUvhyTZP5zq0knnBlToG9kGq3taByu
         /mB28e0A/ZGAw+ZUinv0+6OcHmkZ2GUlN/ZVlxoMrRE51briHnYlvAi2oxooUAmELm2J
         NKp0NJ5sZ3z3+zP8/RtmpLynSi5vno5pSfCZjLh4VwjcJURrd+pG/9OewKxlbcu4wEpe
         s2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528791; x=1793133591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
        b=LYrTZjjS0pECz3JePwAcOuL9x1guAIaBnCPbQSTWI4mDtcDVrEqnRQD6yNeUS4kXGj
         KNxb1TaQG1jXzn0mcVEUjjb+4pl/R97LiGG2dqTLrKrDMCPBFXWxbBlUfxLuSDcEb1Od
         xm4JU4/Hw0zddrbd8xBeAg5r/nW1lqKeojF/FM3dSBG0XLXFlYyQbhMrb8IDbG52Gs9d
         pPVfC1XMWSzvfGnwKXeh94zWZXX37br0ANn3z10QuG9SgmCxS8nABGv47dTZchMG4fMm
         puV6nnYzejUqHCMmlQMSmje4SYIk4v/BxCVKhWwM8WYfL69j3jTnFITw+S1rH40/BaF8
         oA+w==
X-Forwarded-Encrypted: i=1; AKwUvByBPa0bPdUjtESBJ27THvX2abmCYDNmGw4vJvDr8ZNxb3k5MCT/eV+T6e/OJbndI3nHfFxszW/Ug8k=@lists.linux.dev
X-Gm-Message-State: AFq9FYIVd8baB5HYSFwbs68wRf8Ee5nHggU7cCCGd0bgAMBMjXHhhRBy
	z3WBhJaCrpnT57+nIxrhgiOKo+PObiupPSPPmQdvCPAEhugkr7l5Gxzq
X-Gm-Gg: AYBFou0WJEroFP8+QS2c0QvmrsWAbC6i1wXL1dQ+NslLdrRfAH7r3+WOU7uRj1R5WL1
	jZZZ854DdNbICZYWyBBFegVu/HKggBuzYQvCXP+Rc8uIPtjL8Gl4/+HecdKEWcwXObRCHquEwR/
	MvArD0zHILJXzYSj7o8QnqJgI9KsCccq/XdM/s9H/xaaOCKQDb2ipkf425btewkZN0Eu3vDSFD9
	6OsRfLpKR6yLRTod+3EfqI8xCn8VQDRF8RysB8WHpvNFeGdjZ7k7xYZb+xRBIVL+Jr84K1hO9Iu
	6Qun63DkhFvh4+T68V4pWbBhqt1cDRWMihwp8uS/hTUW5tmQqkWP3FAk3jLZn+cl2eOd/MKkW/9
	rNBiotDQmQUzRhN2ooUMkabG0kAg8qo3bfUJHOca1yqXxykN3IqBZ947hWXyi7mS2H2YM5v+jsd
	mhgx2iiDn1yuu9Z2o875edMvK2sDRfO+Hban3G/HBWv8Vp8kY6QKKgcyErrmnha9XcdYJw1qC88
	g==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1dbdf1a18mr238063555e9.2.1792528791378;
        Tue, 20 Oct 2026 13:39:51 -0700 (PDT)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:691:6627:6830:68b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm90720295e9.6.2026.10.20.13.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:39:50 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v1] wifi: brcmfmac: skip bus_reset cancel when the work was never initialized
Date: Tue, 20 Oct 2026 21:39:13 +0100
Message-ID: <20261020203916.381637-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

When the firmware request fails, brcmf_pcie_setup() releases its own
driver, which runs brcmf_pcie_remove() -> brcmf_bus_cancel_reset_work().
At that point brcmf_alloc() has set bus_if->drvr, but brcmf_attach() has
not run, so drvr->bus_reset was never INIT_WORK()ed. cancel_work_sync()
on the zeroed work then trips WARN_ON(!work->func) in __flush_work():

  brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac43752-pcie.bin failed with error -2
  brcmfmac 0000:01:00.0: brcmf_pcie_setup: Dongle setup failed
  ieee80211 phy0: brcmf_fw_crashed: Firmware has halted or crashed
  WARNING: kernel/workqueue.c:4409 at __flush_work+0x318/0x338, CPU#0: kworker/0:1/10
  Workqueue: events request_firmware_work_func
  Call trace:
   __flush_work+0x318/0x338 (P)
   cancel_work_sync+0x6c/0x90
   brcmf_bus_cancel_reset_work+0x3c/0x54 [brcmfmac]
   brcmf_pcie_remove+0x5c/0x124 [brcmfmac]
   pci_device_remove+0x44/0xd8
   device_remove+0x4c/0x80
   device_release_driver_internal+0x1d0/0x22c
   device_release_driver+0x18/0x24
   brcmf_pcie_setup+0x58/0xc94 [brcmfmac]
   brcmf_fw_request_done+0x14c/0x198 [brcmfmac]
   request_firmware_work_func+0x5c/0xe8

brcmf_bus_schedule_reset() already gates on bus_reset.func for this
reason. Apply the same check on the cancel side.

Reproduced on a BCM43752 PCIe module with the firmware file absent.
With this change the same failure path completes without the warning.

Fixes: 43b25879f004 ("wifi: brcmfmac: drain bus_reset work on device removal")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 92ec269f43b2..a3d662348711 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1186,7 +1186,7 @@ void brcmf_bus_cancel_reset_work(struct brcmf_bus *bus_if)
 {
 	mutex_lock(&bus_if->bus_reset_lock);
 	bus_if->removing = true;
-	if (bus_if->drvr)
+	if (bus_if->drvr && bus_if->drvr->bus_reset.func)
 		cancel_work_sync(&bus_if->drvr->bus_reset);
 	mutex_unlock(&bus_if->bus_reset_lock);
 }
-- 
2.53.0

