Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0F448CEF
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428507; cv=none; b=tiBzzTgv5uuyeGz0ekw2E3YATrQwHER8Vk2eghmUBXiku80ouxfRLc3ZbW5qUF0C+STu56pv2oxPiFYfG/gSbG67YqzDroiv7sM7CqZlm8i5qo3U9SElx9ENPdrQSpOrgqro/6sZwV10jq8+RaeFgl7cr1vGujDcKAPwK59L79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428507; c=relaxed/simple;
	bh=Hdwf42WICGC+EP1O8Z+0XvId2aI97zszyMJuW5ia80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hl8rkmUT0iVDIH8iGZjyW2nnzwHUbEgClcAhsT2sn6QBEAe25OTMsLT8s2K/iLVRMggs44mh7eoiQ8Dlu2oj0NC99SyqNfQfGCMoqznL4Ip4DzOOUDlezUVAn0OySgHLdzcHPAIv8v5zeOVVhpGuKXmqsExueKwTWVgg1dtCYOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l90dVd+/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l90dVd+/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso7061a91.2
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428505; x=1786033305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd5GnMV4YHUFaBqZ8HhG5oCdvPmPlqZROl7g2jgvDNU=;
        b=l90dVd+/uPriBW54JsTYryHidWTxGvjqd5Wsk37M971evtqdEIkLh20ziFPaPX2o1Z
         5bnamJx96V3gDAPiobc83B3yAgzAIg+sgL3Ozj15bjxJ6RTBGWm4JN2rjM2fgf1JKwh+
         DOYY9EKWXkfJKDHS1ZZAlHEFJfa5h2eKRdU1Cj/0/jiTA2jPSihd+QQfobcxoEItQiUX
         Aw+vAFTIZRHbfTYrLn4k7PGvS+nP9yPErMgPvkfrGVsHhKFiwJe5K3EdvpOEQvPwIzv+
         JhRxJXYhMjL538rA2ePO/Mrr7VH9zuxPW4t8cn4jQ2lwc4XTTR4CMaz5COGEcFyk0LxW
         7sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428505; x=1786033305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yd5GnMV4YHUFaBqZ8HhG5oCdvPmPlqZROl7g2jgvDNU=;
        b=hUda36iuOgI5g3xOVb0AYtL+nqBt1vQw3OTzJKDrwVeDK6v+O3fHMmwcJlbWqC6+Wh
         3ydcRpWsnROn09F67BTbVVxU615e2h8rvYglxgsWmWAwmZqtS2kelAkv8iGFlAmH1fkZ
         AwOTW6MU/3iqcUdEWe7cHU3WF8qRcGY0VN76OBQ7ljLD55UrdLiCaMBdESNFOHvzWe+j
         J5FQpqwt8cuGi5552PRETa0JEJwrgf33t3KV275XeT9Xb8Qt3KkOH5DPxhSbh2VJwHrX
         wG4WOF0GtYuagCCo2CGidwNh4qq1FRQ0a6NFlI7dNbzFwYkfdOykIJClRwwxRS1edCXi
         /fgg==
X-Forwarded-Encrypted: i=1; AHgh+RpSAClLXKq2bsdy0VX65IjR+sVkoVLNgX+jCzO1BvHidBlcE7AqomAUDVGHcnh6uhWuHbycLa8QKyk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAqFusqMUpwh98/KZxWcnLGI0PraEEhO3hOaRW/FIMG/IvAJEW
	+VSDz68NcklOMHKJGvLSWADgR85kN7o/fw3SY50xI+VgbKbguVC0A9zg
X-Gm-Gg: AR+sD13pO8ldODjCrGHvcxYDWchUan8qFfwMPCZUimOhx++D2zaxfEg93V/CKKFjPB9
	4uNEwzOPTN9L6wk2Trj14wYqfo8A1T6HqGOe/dop3c7xqYGDkZkCxGlfzd19IYW16LtFgtsg6So
	rDklwTUvzLnRgUc2Tv8ze7MTbNYK/HdNgWtz08HaJQKaSRQYNgDOHJm6oZSs3z5xi4orZfpT1fF
	LIr4KRWntLF92hDpjGyyBj/Kj1vU9WJuSnJ5pMim4p5rINncRr783FSveJ4z0QjHQGZnaC1FOCX
	yynx8Riw2Fdka+Vt3zRfN1jSg9ONwdn9bONyBkPumg4sZNEEwuTR/yf4j2N1fhgs1UcrgjWd6kY
	Jgjq/0cS1h79eVLmdOISAUPCXnVZmYQlomOs1GpGyU7dMo8fJPap1rvqWTyMTKQ2GS4deF8vLh2
	g2R3g8y7cES1HQPLGZFjAd8rB4HklW6AJMCI0Tt2Mc1/hGXd0Px0bVayu2ypOj4py/GCNInp5Kb
	G8=
X-Received: by 2002:a17:90b:3c50:b0:38e:549:9e04 with SMTP id 98e67ed59e1d1-38fa7f28d64mr892779a91.1.1785428504732;
        Thu, 30 Jul 2026 09:21:44 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:21:44 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 2/8] wifi: brcmfmac: sdio: coalesce host locks in rx path
Date: Thu, 30 Jul 2026 16:21:05 +0000
Message-ID: <20260730162135.12278-2-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730162135.12278-1-shivesh@example.com>
References: <20260730162135.12278-1-shivesh@example.com>
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

