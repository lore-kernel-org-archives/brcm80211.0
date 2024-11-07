Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F618FDAF
	for <brcm80211@lists.linux.dev>; Thu,  7 Nov 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986183; cv=none; b=q6+AilKRkmTrcRP/iudHL8T5w+BdXIy/9Y5tCubfoz04L5r4mU99FSba8gsHWo3t15rEY9fodRgvyCpnEc4d0mlRaLbVwOYs4L2YunhaLNoFwPgS183CrXN/Aq9ZE+EmgqjtZpGtUnlVOm/cfo7USgQk6TcZwBe7b4nMBfcMkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986183; c=relaxed/simple;
	bh=JPx5Yy366qriUZJPznuz1j6aJBb652orJPWVANgqp9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNuKulfRVbvxwA3BoseHWKJ3NZOfrXpK/TfBdX83fXVTdIioVkfN+TQcrpT7cOP+Wqs6ImErfKwhv+9MDPXz1QD1bjYO+/BMAwVebST2Iv60ys/Jw7YtA/bvMIhT+6AqEBHEg9Eo4Uz78cxYMlxG45YdN6IYgjm8j6IcQfeNkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiwszYQD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiwszYQD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f58c68c5so1527972e87.3
        for <brcm80211@lists.linux.dev>; Thu, 07 Nov 2024 05:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730986179; x=1731590979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3R7ZL0no5oqV13HdTl2lduOwzKG0mLzPGiwll2wJ10=;
        b=kiwszYQD7p8qYY1GbZoWXBwQA4irMY7mmz32I/2pt4tI5WE37O4Rahq6C2ZmM3iXzz
         aP32t3M//oVwpqYdiWNkmRNu0d5KxCMfvHqJ/ClNGomRlkWOulnzn74JywbWGxrc8j5m
         C5QCnYn3othgMRBDkAAo1+yaR0fWNPZc1/a7XNct40I59Le6mPAEOfszPwJ/oHD2azE1
         Gimn/GPJADk7i/v++gBEam3IZlCV7mHRAGX37MeJBMJHMn6uJHVVNqFo/ME9LEfUyxM1
         XwX3VmhI/X30rWl1NFmO3xDW5+C8luqbjC1Pa8T6k4/7YV6OhzjB9zxpiXr0WGnm8+jq
         kMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730986179; x=1731590979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3R7ZL0no5oqV13HdTl2lduOwzKG0mLzPGiwll2wJ10=;
        b=mwSy6VNp/r/PpHcoCzNoeozkgxzPvlWhx4/M8Yx2QeFxy21NsXRFbzCK4IwOrAUQaX
         VBORy9QWvBbSR6m+XAfQCeR82G7/1sNjeoJdw6SYe4DeU67UJsNfvRYl4i1s4GZl+nJb
         8ke76idWKskg/qZCtmB/ZyTH1G2vTzwGnXXIa7kF6fbYgf973zBZqpwLG6OWyJcXbUMH
         BCTH5jUiVQAWyTEZjNmuMqFnZG2x2sWW2IoSLU6rOOB8tplWldd3/DKZ5TpsvKxcImiu
         Rcj2omCK6MZj8A+FRSQt0F6+t81eu7Tmu6ClNs2LZ2pYfcDeTqS/ZroD7xtsLbDdl0k2
         XHnw==
X-Gm-Message-State: AOJu0Ywb4JsqnZxnLa76PpP+9aD9GpkjVrHJxF31x2gK25eywxTo7dxu
	FTpe+D+cR4VH3oPyIbdXZdxkn3LZ77dTRTkguNH8g9XEycYvEeWGHit49nFDe8TP5g==
X-Google-Smtp-Source: AGHT+IEDpMGA6FOc1dk/vMrHMeEQBGc7ESDqPRGsevIRrEuMSDQohjeGdZxKD/nFlExCJBMdIueWug==
X-Received: by 2002:a05:6512:e89:b0:53b:4a6c:1849 with SMTP id 2adb3069b0e04-53d65df29fbmr19496324e87.35.1730986179023;
        Thu, 07 Nov 2024 05:29:39 -0800 (PST)
Received: from wlt.. (144-178-92-130.static.ef-service.nl. [144.178.92.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176a6sm94086866b.16.2024.11.07.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:29:38 -0800 (PST)
From: nvbolhuis@gmail.com
To: brcm80211@lists.linux.dev
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	arend.vanspriel@broadcom.com,
	Norbert van Bolhuis <nvbolhuis@gmail.com>
Subject: [PATCH v2] wifi: brcmfmac: Fix oops due to NULL pointer dereference in 'brcmf_sdiod_sglist_rw'
Date: Thu,  7 Nov 2024 14:28:13 +0100
Message-ID: <20241107132903.13513-1-nvbolhuis@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Norbert van Bolhuis <nvbolhuis@gmail.com>

This patch fixes a NULL pointer dereference bug in brcmfmac that occurs
when a high 'sd_sgentry_align' value applies (e.g. 512) and a lot of queued SKBs
are sent from the pkt queue.

The problem is the number of entries in the pre-allocated sgtable, it is
nents = max(rxglom_size, txglom_size) + max(rxglom_size, txglom_size) >> 4 + 1.
Given the default [rt]xglom_size=32 it's actually 35 which is too small.
Worst case, the pkt queue can end up with 64 SKBs. This occurs when a new SKB
is added for each original SKB if tailroom isn't enough to hold tail_pad.
At least one sg entry is needed for each SKB. So, eventually the "skb_queue_walk loop"
in brcmf_sdiod_sglist_rw may run out of sg entries. This makes sg_next return
NULL and this causes the oops.

The patch sets nents to max(rxglom_size, txglom_size) * 2 to be able handle
the worst-case.
Btw. this requires only 64-35=29 * 16 (or 20 if CONFIG_NEED_SG_DMA_LENGTH) = 464
additional bytes of memory.

Signed-off-by: Norbert van Bolhuis <nvbolhuis@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 17f6b33beabd..42d991d9f8cb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -770,7 +770,7 @@ void brcmf_sdiod_sgtable_alloc(struct brcmf_sdio_dev *sdiodev)
 
 	nents = max_t(uint, BRCMF_DEFAULT_RXGLOM_SIZE,
 		      sdiodev->settings->bus.sdio.txglomsz);
-	nents += (nents >> 4) + 1;
+	nents *= 2;
 
 	WARN_ON(nents > sdiodev->max_segment_count);
 
-- 
2.42.0

