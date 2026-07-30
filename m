Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D673385D7B
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427476; cv=none; b=sMI8Q9IILA8+69a7TSpbrX4WGbHL5Re5nVKPweZ7i7GFNZHdZYFYEI61lMpj6vzVb/Q27BvrAFz4JLW0R8JvsYtT+MIx9emaojhWXT6tPcnMHb4caa1VS/T140BNXWYpO3o5QojDbIm2WuODNJdNGYnSqmDkH4mgvBFNv51YslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427476; c=relaxed/simple;
	bh=uVNCm45C3XC07WQGOTZjv70HxvVG+1BMzGP4bpvZu7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ce4iD758nDKuCbGRwfdd5U+O2TVWQZHQMrVHGPjYmPjpNkyIWFBCAes6dE0e0I/fHfhElc5MsdbtyuYFEO3xvkPygPfwDqz0BP43XFJ9svo1cFNNUFoMsuFw+OMyHdzLHXFVyW30BR733qUGOLArRq5VTsqKMfpXuAWesAUUerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvTfQFaU; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvTfQFaU"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb2513ec378so178052a12.3
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427475; x=1786032275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TERzNlpS66WxjkUnYI6cB5mJn+bQoDdEk70EG74DgeM=;
        b=cvTfQFaUIGcPtt1L8TDFjUFX/M0tIbg40ezP3aFI+GpNLWIRrlKxVeX10gwGMnrVQX
         udwhHYIFPAwtxW9I54KCuG3WBXqUisaeLWI3ge6iNTGD4SCKSwxEJHV+yTFaPZNiiBOM
         adtqA2QsLT76YS/fQiUlMmF+FlK4YydpDZHOboiqSMXveLGwFefnqwWfaa9QZcerECJe
         oGJJgvIq/tn6e/qUx56I58cx0OyO2OO+RCDX+f7nZIkNmi83vfi9V7K9CwSVrxCWu2P0
         XkHZqkjNwp2eZViOwXY6whZXiQ0hswWL6+FNs0/xPw4WeE6PoxN5Dl/eoIOYbOPUg1Cm
         z5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427475; x=1786032275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TERzNlpS66WxjkUnYI6cB5mJn+bQoDdEk70EG74DgeM=;
        b=m8gBygJniQx5QXsg8Yg1TgJPbwjZYnsccBLQIGWRvZn/FpvOGaB+Xzhi9l3welxDx6
         VERJ0toCau8SWPf75qoiEIP6rfdVvZJoIWSGpSPGJ0bcikosDoUvivCdWz4hrv6LpM5Y
         rOKlIOi5lzB8Eb05Qb5GdR4BiwUww+4ibbf5wFw+zqYXgDCdHI96NvOc9ww0t2ImPQOE
         SHrb4eP9/ir2zQ4LY08pxp4zeG8sSD7ykmho8PGcMf73PPWwdCcMrwe4UxZtCX1DvevB
         SI4tVQ6RDwsOUeneHjNOgYh3lD1Ji09KjJYf8jEpCC+sa9ZzQwHZ/VwzS6XTbYnGLBCX
         z5Ow==
X-Forwarded-Encrypted: i=1; AHgh+RpwsnSiRU4ICXM6Dw2DD0R40BcXDTQLRKN+XAZvmKa5zen/iTR7/qIsHz9kvt3q+135QtpUpALbnf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZlCLpy/B7Tw2apZ+gqJwIlCs9PjjpDRQdT2l0ovYctGOvJ4lK
	1LpT+EIm2qKgpdZywXjbQrVR06NNfS2GccNWhJ8miQIg2kuX+e8pbTTu
X-Gm-Gg: AR+sD131i525MsNgweVj0JewtuX/RWMgBEK6gQcM9gohGQA2QxOsO4MyLeCJ7A4qGVc
	p0Z1le3jnnZIKLFaOsTb9Mj92Pmld9xE12Z3AlvBX3CUkItkbLNO9EY1OcQnfFA+/wdGUpsCoE0
	Q5EuB/9BkD+bu317+vzgOA9BGOAtVLSVycq7UT3wGPgL5pICZp7BqRmiUlgxuuQCye9jcuSgumA
	ooM4KcBsELshYxmVNfGcVsJj597jstzz3P1E1i/kVoti06W/UA1fjq7kAHDLSQlSxXKiFGAfBhW
	3VGvlsk6BihQKCsSQH7cLI4F8nADzn9r3IlNd9SSIcYUEmoCFjTYNVNd11PmGCMteVI549nubjw
	Zkwavpkj3rC1P6YY18n7O1uKrggWP0wLRGgdtZQQYkm14h0nIsKMFObrqXvZ5navPFT+ydco40E
	pDAqhgtBk0jZW22QHkoXsRQlNzUP5KpgTi0DXG/gehhRHbtWjFlfGl45qEyDX57cD7WUQgkq8o1
	e8=
X-Received: by 2002:a17:90b:274d:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38fa7c68cf5mr872384a91.0.1785427474684;
        Thu, 30 Jul 2026 09:04:34 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:34 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 2/8] wifi: brcmfmac: sdio: coalesce host locks in rx path
Date: Thu, 30 Jul 2026 16:03:50 +0000
Message-ID: <20260730160425.11933-2-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tightens host claim scope to only cover hdparse calls, avoiding
unnecessary blocking during skb manipulation.

Signed-off-by: Shivesh <shivesh@example.com>
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

