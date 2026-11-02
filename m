Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622202;
	b=5kKKvDBaqdqe5QbjvXGJ+Uv6cbNkikEsBJi0lA9/hOEcj0E7+kLn4cYHBUaa8XkBf8NT
	 eHlGZArsZADk/ArF0qwACNOJuq7SfEAecO5cd6MwRPQJpmH7/JMtDa+Eep+UQCgLvA0yz
	 oSPthT3huiAgrpmVJaHQ6OEGitl8S2WcP2xv6Oa/CcInHhQDU3hYTYSdB+jKVya/fD60D
	 Hirq3EtwGlusC7BWtPGqrrQ/wG6Hp+z4a/3jHx9wkUOFN4UdEludCBznVDs9q4iA8S96i
	 Au0U5tR7D5NtXZF3FetqgbY5JhFu9EFWkh04RPy+vQZKz3kC+CInaQa2lDvMXVcqAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
	b=QVJ4L8rvvCxAZnJH9TtJ/9aECSnlcqV6qyP1rxmcc59ijVPnEPotA/NwSmNcsbeA5tij
	 /TrJj3WV/M5U8QPLLVtO6revgwx43XDTRIdkbN2SiKZQW5mfVF/DRpe8dwi45dLu7DP+a
	 ANa2UZ4BrKsPjSIvYjrA0z2X+xqsHMeata4f0RddEgd0PzOUEYN1ocu4sRvFgZJG1v9BV
	 cq2cywLLErM3xQ0DCvDetFCu8/DgL47cdjdqTVtqmXnT2iORE75zGbnK1saqwrj2UgrIM
	 F9urfl755l3MEfK2E2t46/HRPhcypG1zKEj8eqEp8rz44smdy2rzbAX7IXnFx3r1usg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R34LB+Yn;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC360A6F48
	for <brcm80211@lists.linux.dev>; Mon,  2 Nov 2026 12:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCC360A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R34LB+Yn
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso25817465e9.1
        for <brcm80211@lists.linux.dev>; Mon, 02 Nov 2026 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622200; x=1794227000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
        b=R34LB+YnDAlR6tLTdHEbLj4haIzlXJGdxm81Tb9b6JLChtlLvN2T5Fx7MSlirA9k0l
         Lv5QS3AJRVWG1/kvG013RjHX66rUBmm+vUPNnFd9h+liFQuS2xwXb1i1+h+rMhCUKIUD
         rX32nxq9p/0hYxmNE5jdz1ZXH2eSnP9MRVTWaGaja+qFOG+Et2rcWABXZRfKbOZokqUD
         hyUl0TWdU0N0/dpzM2w6xrgnEJ6IEjf7q7AZe3xT1eyg0DKkNt3Olq/nmbAdNsVBfOra
         GoVv6ois0VxzAvXXW7xO2CMcOBBMWBKEegU0StVa/ae9ZnK2VJDQtyYIFeYd2OGX9o7H
         xnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622200; x=1794227000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
        b=ScmhMH1dDfX9yeiX33oR/taUgSAEc3+qcetgjcsHwkjFw/6zxVXI79ccFK29HQnf0v
         Ca27sUTWoeQKGh/A6d+zTBdyAR9XzBPVuFSRgSfPclz55NZqZ/ORjuFQTKcR/op+j9Uf
         Jff3GRfm8HVMQsj1zUuWFnUJAiVYQRLa4/Ejj81nw8K3CzBMYnIYcWUycZOGgB/9KDd+
         jE9HRKuvx9ls/VilzldY31ggMf8qLSSmeBWPtQOAnm6oSuZgdJWgRLFYJYHFz9JeIvWi
         G6Svs/d1UFv8xLthQt85B1WjrPjkzD5Mx0MxnzkvWNtS/kg27HPFqmvNsyBK9MOta3Nm
         i11A==
X-Forwarded-Encrypted: i=1; AKwUvBxuBb4m1RSjjJ+f9KrY2qCHffPXo99sigrQoIagBX993lfGqcws5RfyW7DPwhK5kDNXi8X4HK2wHcA=@lists.linux.dev
X-Gm-Message-State: AFq9FYK5aYvM9ZVdmoly8uyUEfYcUe0Lfd7N66KRtCNrH60koNRTJTLf
	Gk42AGrSp189L+odcngF+7xsbDyvFMpX/wSem470UfVAGAE1XxxlSko=
X-Gm-Gg: AYBFou2TjMsbNaVod/tCgeQHNyjRj4yMhmE5BcEw7BwcxtBnCLpqjLqz+2xpIk9FgI/
	790k1QaqOE52UBAm/GVdUpRsXVaxejuHg1x//9ztW6WkPzoDYQqS/cm0RCAA3FkHnftVZ8BpxFF
	jlE9/9rPZNRZsh3zA97i92MG0Cpg0fGfUUnUipksgYl80OA0m1vvdxgAQxqmxf6MFT2dTrWuekS
	5fGiIdjgF1WmrBpx+d6xc7TlQB7ps5BSI5Cm2dH+FjC0zksPadqsSMqFR+LfnKqqO12CSwX5X1v
	/hpFqnepdriN4eWNzT4QnagUVcZ//vPJZ2qn/0liG8kDiCH15b49DjTALlFdptZBZquQ+R2v30o
	8Ez7rmHdhTGNORhXVH8VTcCOxaV62Cp5Or36VaXZDXoDnce97wvonZ2MHggg+AE9Hh0kO/8Hz3N
	XYIl2+nHZAldEZAX2hfZQOmX56FEODazz0vGH+aViv2MGTSFQ481F5ChTNxK0EHkGBdYXCXIFBN
	rSj1ymDCny+rCyuUkaW+QeMGEQnhzKlwt+V2YrwORcGc9VZMfr/8JB6HOZJgyFe2oZP5mTfYg==
X-Received: by 2002:a05:600c:c48e:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ac16bc47f8mr229484545e9.11.1793622199807;
        Mon, 02 Nov 2026 04:23:19 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:18 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
Date: Mon,  2 Nov 2026 12:23:10 +0000
Message-ID: <20261102122311.181075-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102122311.181075-1-tristmd@gmail.com>
References: <20261102122311.181075-1-tristmd@gmail.com>
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
extra bytes come from heap memory past skb->data, leaking stale kernel
data to the wireless device.

Zero-fill the padding before the SDIO write.

Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 71c2f99cdb711..c6dd4148a44ce 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -323,6 +323,9 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
 	req_sz = skb->len + 3;
 	req_sz &= (uint)~3;
 
+	if (req_sz > skb->len)
+		memset(skb->data + skb->len, 0, req_sz - skb->len);
+
 	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
 
 	if (err == -ENOMEDIUM)
-- 
2.47.3

