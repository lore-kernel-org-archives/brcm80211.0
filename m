Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDE47A88C
	for <brcm80211@lists.linux.dev>; Wed, 23 Sep 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196201; cv=none; b=gep5Bta1D4IsodKGyfT/62rjmO2kp8YRoQWVLoD+TUuGMPfQ9B5XNeXuH1S0nrgbH5sloLOkYJS73RBTsRpyzUjQZuCsdS8LhsvXOofmZ1ST6HAJXfEzrWu39C1S5IsWB3nkjQhUHrNB6n8t7Agd8Lc6WY0GE7FGojHlXd8qNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196201; c=relaxed/simple;
	bh=9O5A+RTV6+WlZmfyC5A5jmHDFgIozKOcCdfhC9ZPiVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/IVQgTo6Z6l6JxUAc+HZIgHkf/5s1je8qeuLOc5aUbtTi3MovAEFT6lKO9hvQweAsDLpZT9psn/eURDVyvHMdjfQi7GNN+ORpROvKpQq+k8nNNmoUB3tybfqD9QNAap+uLHpA1gumZwNlbumtS7O3iB5FgKYM8Laqo3tzMNUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ssyo9TeL; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ssyo9TeL"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A58313F786
	for <brcm80211@lists.linux.dev>; Wed, 23 Sep 2026 20:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790196195;
	bh=pkeVyqd0gHWuNdEudklGHxqlb0eI6/T8xN9SIkhcRMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ssyo9TeL1VUqtsPleqkGGNLJWj4JXKeKXqxrBdi46xFvcfJU5fDS6VEKPHq10ofiM
	 a/Lh7ryxyJCr+N4QpZzzFzGFy9gAHPKi7ZisoAfow03IN2bs7DnYCSJlFmMT37Yu6f
	 rBMDAvwJa4Tzn0iaYCJWg92D3VAH80/BBe0cwMjvzw/qaPORTCwCXe8esOyUjveQpn
	 o0Mn1P2eiTcRU/1BKpWPEjrobIXHdzuEqC+WHBlPpY/0BApTInpRFiQlknVOtvUpyu
	 g9UAWqshw0w0a1yacXkDP1nTRvjgY6sq7IcholTW44Z9PckKy2rV9PCc7orkK58Fac
	 yUPbNDESldEsLqA0RYuKsb1VlfgciZz0VWqdKZoDmiSwcpdRUSU/szU/AWV7AQoDsI
	 k+kuBrROWnUIGO8oauNwiUvIgSq+FeK50ZxLeCiJbbO2PplKBCHTfxKEnBqFEzWNAa
	 kCAeIHpOxxy1LKD6WMOKRaya2uUduu16FglRN+5PSo/OkipByF7qD2MiARGk9Vetf+
	 5gUFSGr2kphClkZCEme6AgKlb+hwuHE2LRGIkk94fQAGc/7f7oMXXQPzS++qiu/FTA
	 oufMJ+raeBzcnUeu/vnWMskqRZtpI7i4sos92Wf+OuYrJwxSFYwI/LxHhwHhepOYZ0
	 Pu/pBXnroCin52Ge7yq619HA=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29c391bd2fso121666766b.2
        for <brcm80211@lists.linux.dev>; Wed, 23 Sep 2026 13:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196195; x=1790800995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkeVyqd0gHWuNdEudklGHxqlb0eI6/T8xN9SIkhcRMg=;
        b=X+ev9zG4E7L2/VTbIMqbjQjQ6bPuOVdWWGAj0gCrIUa/npDx0mAAoQkTsZ11Z1cfD5
         5jPHR375erIWkkbPccJjxvUNC9HlodpNAzSsiT+00ZgRexc0d4kfVWEtI5+TOAs++gQR
         zWKgjZ52Cm21xnBdu3gC2Kn5d/z11sXLUgVZXcsQGBx5Nq4Dy9MZMLs3YRp6D8aumr08
         fd2GXwr1tYd2hjJegOuUqt78HgpKUBLk7za55KG1hgMDPUD387zfFIG4DFYStJGiyAKG
         Ju+J2GA5UWuL1TR7tePvtq4VpsFAc2MbrZvGCpLfVofvmP1xhS3dibF2FOaEwqsPebW6
         twag==
X-Forwarded-Encrypted: i=1; AKwUvByL+9la5WqzazlvaFW7t/eD1tokIODvkIvpo8+OCnvwHq0LDI2Uu9D+geNy3ieJgbn1lh0MLP+ThAI=@lists.linux.dev
X-Gm-Message-State: AFuF++l+Lw016uZEcWwskUWNU7eVTnwQMdtEhNKUP/5CUQrPd7bARH7f
	jgNOUYrJDQpTBOLdMxYT3iwVvoCjCyGZ2G3RVPfP6JDAASRXkjBRqh7TOhnU9xRYZEBkZ7wNVrA
	PDDhNK3JArXpaPDmZb3MtTVFJxx8D/hnRCT30aYul6r78VjgP/7tLcqEtmxuk1bQSwu+0zqfxou
	OrmA==
X-Gm-Gg: AYBFou16joxCb6mSSSjAEYCEAP+WtfbP2lKCyXFpMjfRJgbh2xTgCfB8LninK/1ZpMI
	dIbhNiYDA8OuuCh+XZEY44f2xSxcwAA0EFrvPTqCAkzSc2GuWw5N9X3Af7AvEX/18AHmOPurnEg
	Ecckk6u6Sf2+AJJMtB8NY8IDBJag6mHplTwJ+TT4J5qdJxUhxW4mLnUWfUaJiHmgdDRWSt+1uzj
	KnP3GBPm2Qqykkw0h20QpnjmSKpmH3Nfi5T73dYPw6jcGHLgXbdtH4wshXecfZh8YuojVcuqNAi
	APRZlA6wECHrnm15sEiWFmW3vxd4bGWE0y48dNSuH7ASoGBtJqcSn/K6pQJ4FwQ4XUNJIwO4f0t
	TwkpGh9Zr3jAcNh7lCnbkF+StEabM5QOpygBI7eO7OpF9+Ft6tIQKrIePoWZ295hQy6qBvCFHM4
	YfT0z47GE=
X-Received: by 2002:a17:907:c49a:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2ac2379379mr24048866b.24.1790196195182;
        Wed, 23 Sep 2026 13:43:15 -0700 (PDT)
X-Received: by 2002:a17:907:c49a:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2ac2379379mr24048366b.24.1790196194916;
        Wed, 23 Sep 2026 13:43:14 -0700 (PDT)
Received: from deep-thought.gnur.de (ip-095-089-205-015.vkd78.pools.vodafone-ip.de. [95.89.205.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6a4a00sm185431466b.46.2026.09.23.13.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:43:14 -0700 (PDT)
From: Benjamin Drung <benjamin.drung@canonical.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	Benjamin Drung <benjamin.drung@canonical.com>
Subject: [PATCH 1/2] wifi: brcmfmac: Add per-board clm_blob firmware binaries
Date: Wed, 23 Sep 2026 22:37:38 +0200
Message-ID: <20260923203739.2560527-2-benjamin.drung@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923203739.2560527-1-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Ubuntu 26.10 these firmware file are missing inside the initrd when
including the brcmfmac kernel module:

```
/usr/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43436-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,500.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,4-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,400.clm_blob.zst
```

Commit 885f256f61f9 ("brcmfmac: Add clm_blob firmware files to modinfo")
added clm_blob firmware binaries, but did not add them for per-board
firmware binaries. So add a similar glob for the per-board firmware
binaries.

Bug-Ubuntu: https://launchpad.net/bugs/2168109
Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 381801af3ac9..3cff0f1fe25f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -631,6 +631,7 @@ MODULE_FIRMWARE(BRCMF_FW_DEFAULT_PATH "brcmfmac*-sdio.*.txt");
 
 /* per-board firmware binaries */
 MODULE_FIRMWARE(BRCMF_FW_DEFAULT_PATH "brcmfmac*-sdio.*.bin");
+MODULE_FIRMWARE(BRCMF_FW_DEFAULT_PATH "brcmfmac*-sdio.*.clm_blob");
 
 static const struct brcmf_firmware_mapping brcmf_sdio_fwnames[] = {
 	BRCMF_FW_ENTRY(BRCM_CC_43143_CHIP_ID, 0xFFFFFFFF, 43143),
-- 
2.53.0

