Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769132;
	b=4kvHSThZGiyUKx+ZD2wLsXkE6z6Jg7tGdzr2s982wqvMOhZi8tMLULywm5eRVs7rEVhc
	 BbFsfEsPuRTwAoVTK15jxGTPaofnW4Offa3wGBmpOCI7+wDetUor9+DmeLPi5pTA69JBx
	 80R09gIDVgwsQL5gl1OyseZ17om7tlRkVg/DKDGmPwDz7TAUKeTefV9lr8XrHo4JdWUqP
	 i0jHFSFeUUCSQ4j6SLDvKhmbJ/6hZICbagJRtgNwn1LjhRIlm3Ju28cV2jHg/yoe2odb1
	 0pR5UJcRBt6PhtAKPJsRYYrnRngefWOZqu7ky2FrmbYnJdwxYupKg8z2MBruH/zx5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
	b=f//LZ4pFxqM7f54f2lHy2OUFPfPWU8ScDi/jAvKIZSChj0/0lNHptF5XbIy3hE34uaXO
	 i7ANwUKguBxylUZAY5PotadpZ6G9uPliHmgOed8N0z9aDjUp0EUqGP18gyjTuCpoDL73A
	 4+OYI1Kus8ssmOVKU0g3NKL4b9858vxgf1uaR3/4Y/+uS5vMAU+TpD8WM82ubmXhQH8gP
	 eZ7GpfJUz5uGp7c4RS7W53xDrPtov+vzqpEJrbn5izttCMY5xBjzLf7Ke+sB7Vk+AKlI8
	 XXes2f6uYGAVnjWzBy1p0A0XkOrtm3oMBmYWAQA0Ab0nNQou6O73BKVSf+x5kg9IU+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZe5NFjI;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C336606A89D
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 18:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C336606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZe5NFjI
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2028176c88.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769132; x=1795373932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=VZe5NFjI9q8Y9W2xnoDWgbhIlMWubKpn1eQoUQADc952ZnGFyz1/KN0nztfNPmyNzz
         nMLzRXZNVlekDsiNaFmxFe00DLcvs9RnIi+hL7RawAuVcAufQs9G5NfCswStDOUCodM4
         aS9Lf5k7Eld6C6VPiyQvGH4/NrrdxY4XAMnksCXsE3m7oxWnw0FArp1v7/SZwYzTMjzL
         MVmXPLuueFRf52+0ZsklhdigayHI2RU3xbSsC+LP5BlW/dxcxnCH+lfh4qLyKg+V2D7f
         mH37LPM6B1q/EP1Z+t7cuhT7NNrO7v3gWZHyoCT6fiy0yWvOV2ms36Om0sxa/oHoBZVB
         i6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769132; x=1795373932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=JyIB6DbZwumaxSi79r3PZbwKLnCL+obiG937gYot9nzOETFwZG96Vtxddo+HTVXYlq
         lJdkYjCG1H6wo0bx8hUgRCTbTHqi5EwpTBdjdOx+XMliMppXchByUZtKPcSoBOU1U2Cq
         /jMl+nZz081sSOx4BOshu0Ztl396zWJGqzzzePBdYmTQhiOPkUYCmRfTtw2W6tmZZMgs
         kCquXj/YpV72xEhtr4wzreo0/Q0SzZTBB67ZkhRZ5AxRcHv8vdZIUQkZhoI0Ud8BIVSr
         TNKsxrDZ6lHVamt6P55YKcPpldq/bS1MLnla7vRXYveeid7iDMwrWk0Z3hJO9mx9DslG
         JGWg==
X-Forwarded-Encrypted: i=1; AL+hErGOmdfz8szYH/EztgvHOBiQbMp7OyrU9aRNa+gbXeC5zV8xYGZnHjPcMfSAaG7j9guuPt/u+u25jJY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+vWlHcA5zpR3rjPkOVmhOgQto1jAOEOjBYNVASM571fBQD5Gfq
	N9hfAA0jwqRjDMWhvEqv5CylZWK+TQ9NffxkezK1lLO0uy6XdjK2+BuT
X-Gm-Gg: AYBFou3V++PGrOm+e6JsdhCYXmaLVF/CYamQ41j8GMaXXzfEtceSp2jDrWZcJf0dHfa
	DU6Bu9aCrY/wGOuxLiYo/6mDbWe6jmaD834jz9o0KtBUIfET8v106zGxgpVQBVPV91nMVXFJnEr
	WzGz+rUNY1Xn4yU3uTk4xTfdnagH9D8ibqMpkyg5FnJyeljbFG4xiTAlmMxugGZXPqKnqjZ79T2
	SZDdnv2wfSAHpryecCO7FNGW+hL279V9CnXwJKg2UlxRMl13V2TwcFDOK35niLDZ9EDrDhOFGiN
	6xTZ/+t3b1yqLFenRUWqXeIH6lQ/zvX/af4lLnnfeZsZK1VyKm/felPQHwXRu3QmI8B+RkaFESR
	qQ2PxDrNx4gOqjNnigjbSp34UM7HAjOVQrv6i+3K8BR2dxqW1EtBO9T8aDLt0BMwYNRKahdB4am
	9d4pn33mKSxgywIIJoiBFzbzU+HnFiFXRgdFhjdaWh2oiS9CITOxtlI2j25ceKi+lcBCKlHY9Hg
	xZxBw6IW00Fydf3iUg/DFn9isPixoiBW0q/gWi9qQdh/AAD8mxNAMTVPq2oa1q3PJeUAqYeDUb8
	Lbny9V72EFv8aw7/fk1FC20gz/m643x9uHJe/0POZDqVPYE/OqLipA==
X-Received: by 2002:a05:701a:8148:20b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b5030ad3f8mr7907297c88.15.1794769131451;
        Sun, 15 Nov 2026 10:58:51 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:50 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Mon, 16 Nov 2026 02:58:42 +0800
Message-Id: <20261115185843.64633-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
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

brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
starts. It then uses the indices of each frame without a check.

	rfi->pktslots[rfi->cur_idx] = pkt;

A cur_idx above the allocated maximum makes the driver write and read
past pktslots[]. An exp_idx above max_idx makes
brcmf_rxreorder_get_skb_list() read past the array or loop forever.

Store the allocated maximum in the flow. Bound max_idx by it and the
other indices by max_idx. Deliver a frame that fails the check without
reordering.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged runs under
AddressSanitizer. It shows the out-of-bounds accesses and the endless
loop before this patch, but not after it. No hardware was available for
testing.

Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
index 399b6810e394de..19cecb987a87bc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
@@ -52,6 +52,7 @@
  * @cur_idx: last AMPDU index from firmware.
  * @exp_idx: expected next AMPDU index.
  * @max_idx: maximum amount of packets per AMPDU.
+ * @alloc_max_idx: highest index of @pktslots, set when the flow is created.
  * @pend_pkts: number of packets currently in @pktslots.
  * @pktslots: array for ordering AMPDU packets.
  */
@@ -60,6 +61,7 @@ struct brcmf_ampdu_rx_reorder {
 	u8 cur_idx;
 	u8 exp_idx;
 	u8 max_idx;
+	u8 alloc_max_idx;
 	u8 pend_pkts;
 	struct sk_buff *pktslots[];
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index a43f1a38b0e30e..e81105154d6543 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1721,8 +1721,16 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 
 		ifp->drvr->reorder_flows[flow_id] = rfi;
 		rfi->max_idx = max_idx;
+		rfi->alloc_max_idx = max_idx;
 	}
 	if (flags & BRCMF_RXREORDER_NEW_HOLE)  {
+		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
+		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		if (max_idx > rfi->alloc_max_idx || cur_idx > max_idx ||
+		    exp_idx > max_idx)
+			goto bad_idx;
+
 		if (rfi->pend_pkts) {
 			brcmf_rxreorder_get_skb_list(rfi, rfi->exp_idx,
 						     rfi->exp_idx,
@@ -1731,9 +1739,9 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		} else {
 			__skb_queue_head_init(&reorder_list);
 		}
-		rfi->cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
-		rfi->exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
-		rfi->max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		rfi->cur_idx = cur_idx;
+		rfi->exp_idx = exp_idx;
+		rfi->max_idx = max_idx;
 		rfi->pktslots[rfi->cur_idx] = pkt;
 		rfi->pend_pkts++;
 		brcmf_dbg(DATA, "flow-%d: new hole %d (%d), pending %d\n",
@@ -1741,6 +1749,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else if (flags & BRCMF_RXREORDER_CURIDX_VALID) {
 		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (cur_idx > rfi->max_idx || exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		if ((exp_idx == rfi->exp_idx) && (cur_idx != rfi->exp_idx)) {
 			/* still in the current hole */
@@ -1811,6 +1821,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else {
 		/* explicitly window move updating the expected index */
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		brcmf_dbg(DATA, "flow-%d (0x%x): change expected: %d -> %d\n",
 			  flow_id, flags, rfi->exp_idx, exp_idx);
@@ -1830,6 +1842,12 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		__skb_unlink(pkt, &reorder_list);
 		brcmf_netif_rx(ifp, pkt);
 	}
+	return;
+
+bad_idx:
+	bphy_err(drvr, "flow-%d: invalid reorder index, ignore this packet\n",
+		 flow_id);
+	brcmf_netif_rx(ifp, pkt);
 }
 
 void brcmf_fws_hdrpull(struct brcmf_if *ifp, s16 siglen, struct sk_buff *skb)
-- 
2.34.1

