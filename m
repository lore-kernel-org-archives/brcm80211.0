Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728268;
	b=Edi4jGP8S6mKnoiWigeiZSbRb4rfwIOouLzBHgbZOt4m5+2aljbg9fvmjRSz/xQ9xnKc
	 SCsqPrKwC3Erxzc0XfZRCjooaXZXnkk5AXPNMDifc4hfuE56Caq2wef6KECgvNKKDaCFA
	 b4OSopZgOOdi9dbdYePw+KWZXsSmjCBaQbTSFr1GcQ7RIW1N+GhizBPMQtPTl7s8Uwt06
	 EHwGWTyC9K1Ewo5lcLFoR6gJqB3RnWPKpXG7HpEGDMxeCLBT0XKWVS/rzKuQ9z4CL1CQZ
	 QZWJYRBwCHMBTF0ALY/JM2JDgrh8DLK5oKGWdOzC/0tjhWNMuJaCm0zjyk/rlRs1d5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
	b=YIw4kbMrrvZw6DygcHC3oA4twXye820G0FBA7Rw0n0QgJPHL82WKNwLscVyBVu6uZNm6
	 vRRUk5EH12WVFqITPFdVVZmOdKMRmInXPZtM8G3/rjXDPBCLZfXO9UlUTSU+46yJxNBqb
	 DDJqLUCz/XRncBynUxsM1hDE8SLzwLDQpBheaxHnRjUzTT6mGiyq5iuu/RO7EqwiEZILb
	 +nF7YIYoRIFrn/E/xGN279WtRTFvGqcODNpLQEc6SN5CrCG8V+8Hsn9Aew9m+WgDQ0YSE
	 nikwDZvbj+SJUAxuRhbsyaJOlKzuN6CaPPEa4Y3QKvmVgPKIgJbqVBUZOZt9O78tXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tw+A2X7G;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C0606A321
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tw+A2X7G
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4375794f8f.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728266; x=1796333066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
        b=Tw+A2X7GUyt5h4KNr1huyuTGuFfFVRVT/tWrP2fKA02UeRjIAwiqTpI0vQn7/Oh0vB
         +rIsKswxdOlE14CHdkaxDWu68LVmucBiFi5PgnORfy/bomuTJdXtQTwpIQfVKgYFO7eN
         vtwGWNvMj2RhyYBItSL1NniSdxyIZUv4YmVMHpFSNk7gWjSywCTfmWBf5cGAwKcxjy4i
         BionvdtBFJQ6ppwG6P/ksHMHGHgzxfe/JyXwXvB2U03W1+WM436qbsUbQ6+nJAoff0SI
         ASgdOkV0J8e2IQVaDLdDaSbTc5jlSdlHhTWEMPjEdLx87FlHBLvoO9goFW+3HDsZxHle
         3nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728266; x=1796333066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
        b=xVF1xcexi1b4wlXHCEPXAl5KFOTbRsBJpioFjyc3HmdcCz7ushrHvC2P+wqQRk90iw
         RASIbVU0Ywmq1jCVyQ8mAG5T6AJwEievu/Za1gJXabjmnH+kJRkJGlrXWGy56EIh7rCJ
         Vfh/yNtfZCXnTm7gwz8ociXFdawwnoSOYho7YriCH/nmmkYuO33kKg6uIr3d43Mqt2pz
         Gd9UxUATNPlKIZjlj6nU1s0DIXAC1yfqLzbe8AZ6ElG2DjXYp/ZTjJ4t/OLrBlgMXJFc
         oHs18Krk1Tb9Tg1WY4f7aREot6MPnbEyi6wrZJOgU8lp7jjL9W/j1cSDW2vl3PHQVlr8
         P6xw==
X-Forwarded-Encrypted: i=1; AL+hErEuogksEyEs/vs3SbiZcpBcShAg5lwoi4p7VxhI3ipEaaJHx3o+0W3LnQEROHfpcPcJlxFdGfIp5NY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/InCh6pKlRhFaOIVFHAaHU3QgBjnOfFGguBWeK2j3lJxgQyTtG
	7zyQXV6iXCMkYGm5kxlvdMieynlr+kqPR5WhdY4e55qbAmhx1DfEzfg=
X-Gm-Gg: AZFdTZeOXUSBMRO+oSQoATXlhMVYIm8Tx3cpVTsJS46skgj18KEnu8XtpBGbvPHYim8
	g3AgFkOBBK4PPCXvXaxe8YdnaPCax0XDdKD0CnKeb3fvyokHxuxqHjidZV7hpVezd178NphutoM
	FZqXshdaTPOu/BzNS3du4YgUnk6HD9GRonInYuobykoifXl/SSPubu4gDq4BMY0x7AO3Vne+Xt7
	C9Z2rKwrJdnfoChjOm/9Jc/LTZrQNMm5f6VDh/BbTiYxpDPHwa56DK5nArzWBgjTw3K68x+B00k
	XhluuHwT5y9r45Nrlvjo4bvUmBCeCjFXZlgUFmkfbOsFLc2ZaQ9lfd2WeaqEbx/kLKcrNaOcbP5
	fGK3HVH0eCT/I4H7hVP36SPgCIFLbUKYfAcY0ODIOeHgMWarcFjIIg8fBDk7IQ/Psp6lypNazhY
	Sod8pzylQ0H7XetaXyD2FhVADSmsjwZvfw412uKvRSf8WTKUfQSJtj4EflhTFSg0Vxp4ur+4T1b
	jla9Woy3E56sSQiBIIgzC6kOEWfCS7DdEx+OYn5dLiMeQOHarpjK+kWqiL/OQY8sF6xF/ThMjjo
	yTza5yTpk/wx8NsX
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr309135775e9.26.1795728265576;
        Thu, 26 Nov 2026 13:24:25 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm612522675e9.15.2026.11.26.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:24:25 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Franky Lin <frankyl@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless v3] wifi: brcmfmac: zero-pad SDIO write buffer to 4-byte boundary
Date: Thu, 26 Nov 2026 21:24:16 +0000
Message-ID: <20261126212416.1397643-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
padding bytes beyond skb->data + skb->len are sent to the wireless
device uninitialized.

The SDPCM header carries the original (unpadded) frame length, so the
device discards the padding.  The window is therefore limited to the
local SDIO bus.

Ensure sufficient tailroom exists for the alignment padding before
zeroing it.  If the skb tailroom is too short, expand the head to
make room.

Fixes: 78b3f1c5be8f ("brcmfmac: replace brcmf_sdioh_request_buffer with brcmf_sdio_buffrw")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v3:
- Check skb_tailroom() before zeroing the padding; if the skb
  tailroom is too short, call pskb_expand_head() to make room
  (Arend van Spriel)
- Use the correct Fixes tag: the 4-byte rounding was introduced
  by 78b3f1c5be8f, not by the later function split (Arend van Spriel)
- Add impact note: SDPCM header carries unpadded length, so device
  discards the extra bytes and the window is local SDIO bus only
  (Arend van Spriel)

Supersedes: f935e48bd9a6 ("wifi: brcmfmac: zero-pad SDIO write to
4-byte boundary")

Changes in v2:
- Original submission as part of [PATCH wireless 1/2] series
 .../net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 71c2f99cdb711..e5068da9672cc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -317,12 +317,23 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
 				    struct sk_buff *skb)
 {
 	unsigned int req_sz;
+	unsigned int pad;
 	int err;
 
 	/* Single skb use the standard mmc interface */
 	req_sz = skb->len + 3;
 	req_sz &= (uint)~3;
 
+	pad = req_sz - skb->len;
+	if (pad > 0) {
+		if (skb_tailroom(skb) < pad) {
+			err = pskb_expand_head(skb, 0, pad, GFP_ATOMIC);
+			if (err)
+				return err;
+		}
+		memset(skb->data + skb->len, 0, pad);
+	}
+
 	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
 
 	if (err == -ENOMEDIUM)
-- 
2.47.3

