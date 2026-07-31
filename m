Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAE4483AE
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514020; cv=none; b=pDTjO8Z+eSqvFBxScS+vRL13ggfpirmfj0obfy3EPiZCDmJBxykrnKVyc1QPhTUA/Z+Mq8PvLKE66BrAbUuHpxkygy6oDtGUKEtEhbglQLdgPvLV3s0kS5YKKWT/cSFsImMSXwzuQRpgTDuLjTOpvLB4LFcilF5vOSTnzPoMR3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514020; c=relaxed/simple;
	bh=4FmlVouAtetaruhEeiTx3rFln8aYqYjfQLfKSbIJZ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXFcJlIHYVP/c0zQY0U3YTWiza78hZj0qv1MO4W9WC2yEiismLoUc/E/3n4EiFi6MyeCc4zsp9v8UkWiFchruvrU6gfrXRbnY+QdOqkSpFNpqpC2Vz7gpNXWOeOeyX4tx9onmVZHu8/jRvXAEuEXOXkr7N+ZmZOXfXEhqdc5k0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIdjZZcV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIdjZZcV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad85b7b5aso1045595ad.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514018; x=1786118818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3oPX3E5KdsQaVYxU5lL3g8H/Q6QDbI99g6kazkV/Ds=;
        b=nIdjZZcVqRKPOYQEpTjAAfF8U8Vcdu53n3pNKGqog+s7kuPLbd5DKGGgbu2fi7HRDG
         fnwQCfvYyTCm5XAx+F6ipc/rW3pXSg6blpvVOU2cs+7xvqSXrfOkAAV2XmrQ08DSir+B
         rXuElzi00Uouqx+Hvsl8k9vB24sgPL3w5jUNYiHWXE2eUi9KexCqzHTM/kGajUcySvjX
         lD8m9LloOATlc3XShz9XjQ31ZjGo57rSkptbGEKX2/D7Ojh7eCXurZRO0b2oiZkyJ/O7
         w7YAslxu6VftAW8j1Q0GY9826d6Iui8ulef0wao4CZseiZ2yDHDWfYsaypZwd4QFokhm
         2jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514018; x=1786118818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3oPX3E5KdsQaVYxU5lL3g8H/Q6QDbI99g6kazkV/Ds=;
        b=ndwlCu27JbefkX/E28ngM5Cm5t5Mj5Bj1DbQbvSwIN9pHYpeb7BjAXh7HzVLRGKD6k
         2c2ISIQ14F7lp6gbbQloEHlg/X9ZLitM/8Pry6GE4s+Dibacwa/vIBR28uWKAMd0HinU
         JZhKHYAS4C6OVmR77U4cREUry74ot+mfepPkdBqXdjwzUJa7m1499IUtJWU8RGx8Afdj
         2qMHT2EUMqz3VdpLfIAKjGRhaOLDgkuaJRMYfqI6N40gTrS8NS3pBNu3QYHSnFr32LlL
         vGPtjBL6eUejH+K5OnkXPIMNI6GFr6aZ+bkn+NxPwoPbU0KA6Om6mJljZ64y5DwpuLQo
         A5xA==
X-Forwarded-Encrypted: i=1; AHgh+RpjwIRZz+T1YDieFTAhuqtOV2jGeIvuT/nLVIvkMGB7m/LXZJmawA+QkEx814+l5M1nSflV3pnRVPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHKVolskWKDrFm28KmoTyenYpzH0yZ31+RO61Vugd+60Xya2jH
	S/KD6XKQcjVAg3uqzEPZZ0GAgPDLlqSPrNV5Y3T0Mm9tBvzQlXHKN4fn
X-Gm-Gg: AR+sD10Y7urGBDYi5ixxd+e6UYUGk8tX7lpIOEo3g5ogBUuzPN+ndeWy1ixE/y8SOOt
	dbitkskS0LeEtRxAFJwQOg5ywltd2WZB2iFHo3KxahV4frNz2OmjaiecYerHpvA5R2SNW+VbWt3
	yokDF9x0NUpxI6SpimPQzIOX45RiFuYYtzJHXvh7taCxsm7TUPQ8w7SJ3e3wkcBlWoxa3/qs9Wt
	wZ4i7NA50F4Brb11dBcMpD+6xoFeyh1PddoMjjl5ELfV9AIsusO9Ns1jHc2/pwnRu1t5p+C+4q4
	hxTUU6MbEanWRDQtvUaLqLhVYVnC5cwe+CU77WZccR9aj80q/DTE1r4LrAkbufY6f22peiWy8ZF
	FCK0apPcLxh03unYlJukjLbl1AsFuQv8qnFtB2kMDF5nNAdgmKFA00w+c5Fz7JUWHpL4y7yXwIo
	KElt0yg8JqGvJ5Zv8J1JqQyYNe8iLzy5K3l5RC84XEHJ76vVQ5nXZ9pPLmvhyv4BnMMCAwqiFDj
	y1u1xDX
X-Received: by 2002:a17:903:3c23:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d0523fc4ecmr8448685ad.4.1785514017961;
        Fri, 31 Jul 2026 09:06:57 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:06:57 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 2/8] wifi: brcmfmac: sdio: coalesce sdio_claim_host calls in rxglom path
Date: Fri, 31 Jul 2026 16:06:19 +0000
Message-ID: <20260731160646.3812-3-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

brcmf_sdio_rxglom() performs one sdio_claim_host()/sdio_release_host()
pair for the superframe header parse and then one additional pair for
every subframe header parse. For a superframe containing N subframes
this means N+1 mutex lock/unlock round-trips on the hot RX path.

Group all header parse calls — superframe and all subframes — under a
single claim/release pair. The host is still released before the
subsequent pure host-memory processing (skb_pull, len_nxtfrm update),
keeping the hold time as short as possible. The error path (rxfail)
also executes while the host is claimed, which is required because
brcmf_sdio_rxfail() writes SDIO Func1 registers.

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

