Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8F443A83
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512963; cv=none; b=QjelLodl8lmtQKNOkeMbmSMFRedxMamlcGh0CmSRGLussy8LxqSinI8u6qLFnqJNDUAU93HuFE8PM+Opt6GxP49BPq7UahSpwdpqy/BRgeJdI95IS4GOeHjxNslQkaTFcytNsIWwNJof4HyVF+nGsstLtr3a4J+bDJqpkd8svuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512963; c=relaxed/simple;
	bh=Hdwf42WICGC+EP1O8Z+0XvId2aI97zszyMJuW5ia80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ym4ivR2Drz2t+HscqHz08oKA7W8daBhwvpNVEYLOToj5Tp348oRDjYRfQeMzj+8fD6iCxucoEm/cY5GLRpUOFLE+LgZTeB338HQbpb0gs/RWp0u476PrgE6qaj83TP/V9z8yc/phWZDEqnTURupPRFrcaD5Q+MDiWvFFb790Zv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGfy0lG9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGfy0lG9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso57527a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512957; x=1786117757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd5GnMV4YHUFaBqZ8HhG5oCdvPmPlqZROl7g2jgvDNU=;
        b=GGfy0lG9o1Y4NL53lsk4GCzurSQkljEAG9zBA11pju1YLGUeu3lxproocLnLUsEbmM
         3rAiBz85NLSMTxsF3zNiufv58kCJfaRS4YiyxZTbW6PcYUaW55wbWI+qkfNAiU72DRY6
         27EmPG3mdq8U7w9RnvrMg9RRABleFXT5aLsqm8Ijocw/HkCrkRjEZvKdUJOfHhudvgNz
         dIL6EtajgiouwLC4//6siZUR1uFrlOAr3HQCMQbhFr3gioas83dJnZhHGUTpqUhx0VoJ
         9VZs1nwUEX7YBcuJ8d5/YA9FWL8AF1NTNRwpPYD1X+aH4vW5AOzXZWY2HwoPP1nzf+DG
         ascQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512957; x=1786117757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yd5GnMV4YHUFaBqZ8HhG5oCdvPmPlqZROl7g2jgvDNU=;
        b=XfFR699esIDvluV5lCkoZjWXGeD+KzcpkEQ+hJgJSdLW8nmMl0zdCJUtsZX2xl7/9g
         KGWTX201XF9szRzIi/fvDWe8FZRFVpd/7KOw0/YjlGHd7cTS+ZL/s7FJ4mT/U92yn0xk
         IZBx7sA9DT+hwzaNfqiEOlNezqk6w4TumddUBk5tkJ/ZnZmuLnSw7vwlkNLj8+R0O1nT
         zGTr50EpAxL5q7R/cyw5JysVeujeGcUJBIfNNY6zujlbJMJQ3C4YwrC9DzHX5oFdLmC0
         47NijdLoC2BkWuuz21cNxzmoGYj1F23ai19T2RYweFuuHtUGNf0Al93YnWn2OjbbgY6U
         qBYg==
X-Forwarded-Encrypted: i=1; AHgh+RqwiP1/SNbUT4xDHTuhCC2M6lt9rP4wfClLoiLrNNRV+jVFaCjeJ9tPr82gKNVjF5TtB1Nt0z+kni0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6X+N1fPD5iJwP8wylGtVhZguQ3rPGnbYOReviJHLV3VuyoP4P
	rSACBW0oqkIM1aIfpgDI0r6TZ7jBZjSBDDZsRnxBbZ/71o+xx50gFGAz
X-Gm-Gg: AR+sD131Hv792mt87iOvXH2AZPZvivEs5/1PJWOUBt2gVmh1zOnxllKuMvSLNwuRVpU
	tCUq5Og3JWeLvO4Y11XK3dBhkNNpK3U3+UCbDnv1KQy3U9UnbQSSp2iw2j3A39cA2uqEaeYz1Hj
	OMrIW4Y2b/gQIMODZnGw6/3/U3H6pcJ9/9RAVG94JKneHYZBI07a7XFfGEY6x7eO43ckcNSfBKb
	IsdRCnEZjGDy8+timLNePH5L87tQ0ZPb/RoAyQADC7etKOih5RZVL9In0t6UYG22zny3L2sUF+D
	CTqmiS5TV4U4DuhBNsVXbPvPuy1zhSlmDh08f8Z8lDorGGlgy3wgUJooaLQuYB7XgcgqtSeUQcW
	n/bfTitzqNwkMnXW3rJ60cHXjukAiVUX3sC2WL31hYsFvWaADqgFjLtq5T0BAxt1v5kROF0htiJ
	RwrzspcFYmQ4iJXul9kqWMjX5riKcnp4bEVzCgjv2XTlsKuYUghwwy115MuR2ywaJ4/JoI6XOIl
	Ig=
X-Received: by 2002:a17:90b:520c:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-38fbc506f17mr523232a91.4.1785512956784;
        Fri, 31 Jul 2026 08:49:16 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:16 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 2/8] wifi: brcmfmac: sdio: coalesce host locks in rx path
Date: Fri, 31 Jul 2026 15:48:34 +0000
Message-ID: <20260731154901.1822-3-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Tightens host claim scope to only cover hdparse calls, avoiding
unnecessary blocking during skb manipulation.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/sdio.c        | 62 ++++++++++++-------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index b725c64e5b5c..4e414403d747 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -1645,37 +1645,43 @@ static u8 brcmf_sdio_rxglom(struct brcmf_sdio *bus, u8 rxseq)
 
 		rd_new.seq_num = rxseq;
 		rd_new.len = dlen;
+
+		/*
+		 * Claim the host once for the entire header-parsing phase.
+		 *
+		 * brcmf_sdio_hdparse() operates on data already in host
+		 * memory, but may call brcmf_sdio_rxfail() on error, which
+		 * writes SDIO Func1 registers and therefore requires the
+		 * host to be claimed.
+		 *
+		 * skb_pull() and the num counter are pure host-memory
+		 * operations; keep them outside the lock to minimise the
+		 * hold time.  Both hdparse calls (superframe header and
+		 * each subframe header) are grouped under a single claim/
+		 * release, replacing the original N+1 separate pairs.
+		 */
 		sdio_claim_host(bus->sdiodev->func1);
 		errcode = brcmf_sdio_hdparse(bus, pfirst->data, &rd_new,
 					     BRCMF_SDIO_FT_SUPER);
-		sdio_release_host(bus->sdiodev->func1);
-		bus->cur_read.len = rd_new.len_nxtfrm << 4;
-
-		/* Remove superframe header, remember offset */
-		skb_pull(pfirst, rd_new.dat_offset);
-		num = 0;
-
-		/* Validate all the subframe headers */
-		skb_queue_walk(&bus->glom, pnext) {
-			/* leave when invalid subframe is found */
-			if (errcode)
-				break;
 
-			rd_new.len = pnext->len;
-			rd_new.seq_num = rxseq++;
-			sdio_claim_host(bus->sdiodev->func1);
-			errcode = brcmf_sdio_hdparse(bus, pnext->data, &rd_new,
-						     BRCMF_SDIO_FT_SUB);
-			sdio_release_host(bus->sdiodev->func1);
-			brcmf_dbg_hex_dump(BRCMF_GLOM_ON(),
-					   pnext->data, 32, "subframe:\n");
-
-			num++;
+		/* Validate all the subframe headers while host is claimed */
+		if (!errcode) {
+			skb_queue_walk(&bus->glom, pnext) {
+				rd_new.len = pnext->len;
+				rd_new.seq_num = rxseq++;
+				errcode = brcmf_sdio_hdparse(bus, pnext->data,
+							     &rd_new,
+							     BRCMF_SDIO_FT_SUB);
+				brcmf_dbg_hex_dump(BRCMF_GLOM_ON(),
+						   pnext->data, 32,
+						   "subframe:\n");
+				if (errcode)
+					break;
+			}
 		}
 
 		if (errcode) {
-			/* Terminate frame on error */
-			sdio_claim_host(bus->sdiodev->func1);
+			/* Terminate frame on error, still holding the host */
 			brcmf_sdio_rxfail(bus, true, false);
 			bus->sdcnt.rxglomfail++;
 			brcmf_sdio_free_glom(bus);
@@ -1683,6 +1689,14 @@ static u8 brcmf_sdio_rxglom(struct brcmf_sdio *bus, u8 rxseq)
 			bus->cur_read.len = 0;
 			return 0;
 		}
+		sdio_release_host(bus->sdiodev->func1);
+
+		/* Host released; now do the pure-memory bookkeeping */
+		bus->cur_read.len = rd_new.len_nxtfrm << 4;
+
+		/* Remove superframe header, remember offset */
+		skb_pull(pfirst, rd_new.dat_offset);
+		num = 0;
 
 		/* Basic SD framing looks ok - process each packet (header) */
 
-- 
2.53.0

