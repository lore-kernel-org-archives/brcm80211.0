Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89826449B04
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428509; cv=none; b=gdfOhZWPxW0gqHUxrkFSgFWMHUUb4YG4f5b880TqByZWsVpoMufm2TjfmIv5rIJcdY+3F55qT18U55MhLzjDuUPE70OMdl4Svxytwe/WrU2tnjS77PqZdQz2GO8MDYdccXQNZXpVEIClgiixnr7Fkt/3hI8tvF92lZKzYmEds4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428509; c=relaxed/simple;
	bh=11o2VHRYKUzasN6xbkTuOKJzZziHdzT348VOo3qx4cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El2IZVJtxf7IimgirzfGHcS0MYrAiebloEwmy/y2gV6qo1Q13xglYVAEo7tOFVt8MHmOyKJKR7BAHPZtcWBRILYtY89Mk5igLHwhaXEWQ2wIoRy9rrtUEV4/FwfZeBmJ/5+lD+k2nR2U3Krd5a3W+9AEy0N2NdGe3okiUMTcuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2y2xinA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2y2xinA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so6450a91.0
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428508; x=1786033308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Julx1UQMQbFkIhi89Hhi0qC7Ef3z2ArBe2a/Ccavl0=;
        b=J2y2xinAX9wqn3Eet2bobVvCLydc8lZXELbjqP3BsEVXezWYpA+nhPqZnoZ+soUqLW
         DrD5B7HcEsR54wnacydkIdnFsc8y/ENZIlFEce/jFK4VCTOW/Ez8blbFaLfMZkQZ0u9V
         4Al2cuLTivw+uBLJ73VoAeiYskjkzjfm2qZVkvmOLg6+bsowoYMF+lVU+PfXE0ElvuOP
         mPOXbkN3z3yH5asAKIGP6JvPbknNaPFvUopkRWsiqV2x6fkmu/Wpa3Q8wagf3L0z5jsT
         9XXjS3auLTT0qfTodbImpSj3poXcgkEUNeJVSzeFzS4TqUWD0cno6y8Aksskvam1DnmB
         VYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428508; x=1786033308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Julx1UQMQbFkIhi89Hhi0qC7Ef3z2ArBe2a/Ccavl0=;
        b=pFWtmBa08aJTidP4rj458S/VrTeK0fR/RBNN4/vOjG1gCM24z1BiRNYI5o9l2Ei43S
         8Cn64M8W2RABgIdK0SbCoAhDVWnUO8DqxL83pp7QVDyFA29zImhvu/fW9+Ig86gqLl1a
         R0DmptuQuDUcjbDuimI0vz2mCykNWiv9TCcLQosT4D6sXCRLZA0FIRCmwkAZqzNyECaa
         VZGcUbAkFXmr4dupOwIV3bEcfXYoxuDpdRZ1g/qxJaHLEgfL/G5MO0uKqr3guBxzI6AF
         KHiEZBp2RBaFOyjieGYd1P6Ld1FgEQ/svi+seLWQqFvQyZxmspnin5VdfC28A7wcHmJG
         D/bg==
X-Forwarded-Encrypted: i=1; AHgh+RqGJtPC6ZygUVV1boJyA8OldyI6eW8pO2dwcZciki9RUMneVjVntaOXTlcS4R+hER5iUEqqTAG/dDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxIE3mat1UvizjGAzBuuuqLDZZECU5LLwySEZC9kMxxzkgjcC1
	oxVMWYxVaiKRcqWw67TW/jxJyY5Epd37IoW2S9A911Uzr9k46nhe+BLm
X-Gm-Gg: AR+sD11Jk58uO3BJ4z/mkzHHe6PlA7Ne7WsBKegIdTOY7kIKLpqZAPmHmXN/ZlWE1Z+
	Hzm1wYR5Dy4V1UQB7IoIDxTNMIxJDrPDQpAn+ibk1X32c2sC69Z2VPfnOlSgxcyzRU8quMTGvtx
	OLWJcG+xcZkrHSCrICQAVcTFr09BCp0fLMS0ZgOo6eejL/0lLX74irqGeK9bmyJc0alWEHrwMuB
	4mhDoAWpUV3+ek2Vi/og3Toine9oJKQgATuOJry293v2Sjx2POwHFUPyBRDIgzbLRgBwW9WW5Lk
	pA04L4EumpzD6RkmxUOIJkCNbyYEBnJOuuyeqAL8r69Kg54BQHu8nj3ehgVKOx/ZSTk6z+M9lJd
	O+tZ/UGcvKYoa707nVlhgX30Wvqn0Rbg+DOzu/vjF3arKr+Mk2tfGAeMYPC52qnFq1Hfp5ORM21
	oUOVaDV/dsxQO2ryZe4ZJQRKqZUNWXr8zXVs9YQ2cYaUMf+jS1xJy0bE28I3YpCIlr99Pw8Dy07
	ek=
X-Received: by 2002:a17:90b:5866:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-38fa80cad74mr798248a91.3.1785428507955;
        Thu, 30 Jul 2026 09:21:47 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:21:47 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 3/8] wifi: brcmfmac: core: populate radiotap header with RSSI
Date: Thu, 30 Jul 2026 16:21:06 +0000
Message-ID: <20260730162135.12278-3-shivesh@example.com>
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

Populates the radiotap header with dbm_antsignal using the rssi
value extracted from the firmware's hardware RX header, fixing
missing signal data in monitor mode captures.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.c        | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index ec170647800d..673f0000389c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -431,45 +431,51 @@ void brcmf_netif_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 	netif_rx(skb);
 }
 
+struct brcmf_radiotap_info {
+	struct ieee80211_radiotap_header hdr;
+	s8 dbm_antsignal;
+} __packed;
+
 void brcmf_netif_mon_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MONITOR_FMT_RADIOTAP)) {
-		/* Do nothing */
+		/* Firmware already provided a full radiotap header; do nothing */
 	} else if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MONITOR_FMT_HW_RX_HDR)) {
 		struct wlc_d11rxhdr *wlc_rxhdr = (struct wlc_d11rxhdr *)skb->data;
-		struct ieee80211_radiotap_header *radiotap;
+		struct brcmf_radiotap_info *rtap;
 		unsigned int offset;
 		u16 RxStatus1;
+		s8 rssi;
 
 		RxStatus1 = le16_to_cpu(wlc_rxhdr->rxhdr.RxStatus1);
+		rssi = wlc_rxhdr->rssi;
 
 		offset = sizeof(struct wlc_d11rxhdr);
-		/* MAC inserts 2 pad bytes for a4 headers or QoS or A-MSDU
-		 * subframes
-		 */
+		/* MAC inserts 2 pad bytes for a4 headers or QoS or A-MSDU subframes */
 		if (RxStatus1 & RXS_PBPRES)
 			offset += 2;
 		offset += D11_PHY_HDR_LEN;
 
 		skb_pull(skb, offset);
 
-		/* TODO: use RX header to fill some radiotap data */
-		radiotap = skb_push(skb, sizeof(*radiotap));
-		memset(radiotap, 0, sizeof(*radiotap));
-		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
+		/* Insert our radiotap header with RSSI data */
+		rtap = skb_push(skb, sizeof(*rtap));
+		memset(rtap, 0, sizeof(*rtap));
+		rtap->hdr.it_len = cpu_to_le16(sizeof(*rtap));
+		rtap->hdr.it_present = cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		rtap->dbm_antsignal = rssi;
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	} else {
 		struct ieee80211_radiotap_header *radiotap;
 
-		/* TODO: use RX status to fill some radiotap data */
 		radiotap = skb_push(skb, sizeof(*radiotap));
 		memset(radiotap, 0, sizeof(*radiotap));
 		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	}
 
 	skb->dev = ifp->ndev;
-- 
2.53.0

