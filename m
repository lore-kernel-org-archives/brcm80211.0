Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CC448B95
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514023; cv=none; b=fEygPwlNLdzctl58+aa7mjwUs/2bt+EEVi3AwbGbOnsBt0tsPn9Opawwbg1xTeFiQFg22c43NIZ+1+FAmLikL+xBxBbuhJAHXnUYEjyY4ndhkDKMiEihFmgm5g7QCR9CdKDiRv3zNgTc3FmMXyyUh3kFb2mZ/ZpJwWZM/orFLPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514023; c=relaxed/simple;
	bh=Jty8yO41/NAzwBTRC93gt7XYppm8tipeHN673R2Ik08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4/q+585hWm8eygjhMdjnu+GCPO54wKC0+Mytn0Qj85f0eRo98RdxmLvRY/Sw53q2/9+h+L/lumCql7NbK1tt4CX8VRZXIu8WVcn1SPXeOfDqRm7Rbg+7lIxu7jYI+DUrbX0T9guKybyEEW2YhO4qVS/qtAldtSSf9r0AMyONCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDrC+xWo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDrC+xWo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so101208a12.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514021; x=1786118821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XauinKQI6tu5wjHWqSFKKt7ebLbypRasR58eoZCbIfk=;
        b=kDrC+xWoKf7Qx+ih4VOiMrvy1pDrvJKq0t2FNs+QU+T50wCG0Znvg1m8DdN0RoLLbo
         xG79hHkgzpUPtL+PJWDct+it0/w95rzWdy7hboLaGYhQ6J6PE07A4IV/zrsBUiuXo5FX
         cXO/M1G0ymu87dwuOO61UO0JSuFuL4jzi55uSf9ojZDokRpB1vMhNald52QLdNudkLgJ
         Gq2Z9gDWvXRbNVKfPPvh9C4FH4JpPvdK6FjSXijxCGuuIJO981qG7BEdwM/2GJKL68kf
         awbqtw2BF5vhv6m1iMFb1XFM6DRewaItdh1oi/5LrtDKD3O0gwTSREz0AbBZzM1MgTDE
         Maeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514021; x=1786118821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XauinKQI6tu5wjHWqSFKKt7ebLbypRasR58eoZCbIfk=;
        b=lMyIPILVFsYXq6h03bjNKQJJLnRgfS45OCBoUPqy0fRj9hOKIWRq8SuiUTFpT0bDCS
         oS9wHPPydg0KiNpmpahIMlqRwwpVSTW6tYSBtg2FMr9RdrD1L9UH1ql12zC6RHdvRrDS
         8GkjwxTimXYhTDn2b9KUgVeglCUyzpfRIEjQgDhlaeK+E9uL9NqBHeaSIyYGQg/FCWNR
         tnuAScFwYM156ImM17qlTXmv6m9LLWAJfZiEaNSNkCjOSQQxgJk3zOP3PJ7ht4U5un3A
         Pj7Nj6ijfe43vcgJ8LG1WSPmsAxPVcFgWT8MX2N+Xo/iwA0TyJlQ4dyDuSvwMWFWmEVR
         +fWA==
X-Forwarded-Encrypted: i=1; AHgh+Rqox8LJSdrTDOg6zBWEnhETh0IPgT3iQ+pOG/Z9JxUkdfIXCADxWmEwQI3OgnxhIL7daclb7ZM01S8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXM+cRP+7cq/aXzl/b8u9EnK84v1U/WD9/JVtFEvnTh39AqERS
	kXwGsY4QWgPiFhw5NQVDbNeFI+04xANrM/XeGnR8sudgGczNBF40NErd
X-Gm-Gg: AR+sD10umP+MYGh0C7+YI497taIdGf9cn9LM5Mq5HKPhcGCUKTxv69WTDcpdgpRlohn
	IBeLvypN4G1vOp8BVJf+DhjpbT15G3uQXQA4yYjTne/ThyRWVoDCEfNhXN8BAdyBVM2qQrVUh1j
	3SuPfoZSwvEk+SX7v70jz9lHHitfo5/ppcJ480jFeHcbwhLd+lvm/ZY3iDb7wynFcaH7uUK34zU
	cdzYwkG8zzsb6T0u+h7MZILt4+UQ95E8b6GjomXbz3FjeAZcX/PlYEd0lomFu+6StvczQewVjLM
	4fUXY6S/h3tYZEWRRpxBzxHaybJuy9UgItR67bXnVLAZmng89xuwPJjehP52dkjDnVAKx8ApWjN
	py7bVLO6MukOPcRBh7dPAVxrIw+fM6rhTI6FqqPNLjS7SWb8bdmuLBXmyn8ji6O08QxQyHfvgxQ
	RoUgbeqb/u7EoFlGJMICqxGId0QkmA8twp2cVTu2LRy3LAkuL6FYcGqHYwKYmhAOUf6JhF/12IM
	BNToUud
X-Received: by 2002:a17:902:f607:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d05209f863mr7797915ad.0.1785514021222;
        Fri, 31 Jul 2026 09:07:01 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:07:00 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 3/8] wifi: brcmfmac: core: fix missing headroom check and populate radiotap RSSI
Date: Fri, 31 Jul 2026 16:06:20 +0000
Message-ID: <20260731160646.3812-4-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two problems exist in brcmf_netif_mon_rx():

1. skb_push() is called without first verifying that the skb has
   sufficient headroom. If the skb arrives with zero headroom the
   kernel will panic. Use skb_cow_head() before each skb_push() and
   free the skb on allocation failure.

2. When the firmware provides a hardware RX header
   (BRCMF_FEAT_MONITOR_FMT_HW_RX_HDR), the driver strips it and
   inserts a blank ieee80211_radiotap_header with no signal data.
   Monitor-mode packet captures therefore show no signal strength,
   making tools like Wireshark and iw unable to report RSSI.

Define struct brcmf_radiotap_info that embeds the standard radiotap
header followed by a dbm_antsignal field. Extract the rssi value from
wlc_d11rxhdr and populate it_present with
IEEE80211_RADIOTAP_DBM_ANTSIGNAL so userspace tools can read signal
strength from monitor-mode frames.

Also replace the open-coded "skb->len -= 4" with skb_trim(), which
is the correct API for shortening a linear skb.

Fixes: e665988be29c ("brcmfmac: support monitor frames with the hardware/ucode header")
Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.c        | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index ec170647800d..eefc437dd055 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -431,45 +431,55 @@ void brcmf_netif_rx(struct brcmf_if *ifp, struct sk_buff *skb)
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
-
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Insert our radiotap header with RSSI data */
+		if (skb_cow_head(skb, sizeof(*rtap)))
+			goto drop;
+		rtap = skb_push(skb, sizeof(*rtap));
+		memset(rtap, 0, sizeof(*rtap));
+		rtap->hdr.it_len = cpu_to_le16(sizeof(*rtap));
+		rtap->hdr.it_present = cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		rtap->dbm_antsignal = rssi;
+
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	} else {
 		struct ieee80211_radiotap_header *radiotap;
 
-		/* TODO: use RX status to fill some radiotap data */
+		if (skb_cow_head(skb, sizeof(*radiotap)))
+			goto drop;
 		radiotap = skb_push(skb, sizeof(*radiotap));
 		memset(radiotap, 0, sizeof(*radiotap));
 		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	}
 
 	skb->dev = ifp->ndev;
@@ -478,6 +488,10 @@ void brcmf_netif_mon_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 	skb->protocol = htons(ETH_P_802_2);
 
 	brcmf_netif_rx(ifp, skb);
+	return;
+
+drop:
+	brcmu_pkt_buf_free_skb(skb);
 }
 
 static int brcmf_rx_hdrpull(struct brcmf_pub *drvr, struct sk_buff *skb,
-- 
2.53.0

