Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444981E1A2D
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839149; cv=none; b=AhiYC/tLyS3Whi9slczqAbUIv1phjf12ssTJ7iigya3ssOaaGuEgelrDrOPmVDFaIoIdS01gmH8ozFOxmjtuAKxzxC5UW/eap7ZPBFm9GSlahy7fxHQs1Xk9pioqFnhmOsJDi/g60jVsgEKvrC5FRf0fnzOf/aeHBXdMuKUgpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839149; c=relaxed/simple;
	bh=SGs/08YH9pzcyzj8Hy5T07XyaLzA+LXAm2VV8KsMYOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m3Eu4rLfgRMKd/bFgl6wyjefxd5jmubZFAQ701fF5BY6aOq2Ng5Y2iwsJx5tb5sSnIjON3alRF4uSPFfwkZcLQQe2BkEhrglcP4l469exhNlw7SPDy8hNSm7+84Sr6BuMZKZAmXedy7hIro+ir3RQa73fqaijRsGvOS3ki2YtWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEh12MvT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEh12MvT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223959039f4so3588455ad.3
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839147; x=1741443947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
        b=YEh12MvTvz4C3dzTpVJAP3utD5AqjWYkxeaRhLKsZoZMDJLLByZd9GxhGJ2y36oH7x
         6WwvZ3dgaa+cBDAqy6qKdTuoPUC0QU3PhUv1owWnMVcfeWp4STw6Hn1a3eMTIbpfUnr6
         4wef2ZZBJlJZQEAgu5eYVD/yugyuUV8oj3akObYm3vsl19rruZFZdcdxBw4V4nqEtlVH
         KXAERClutnimaXmuSRSm4ZWiCr8VL8bCSD9Pos51BG8vwCcMB48MZ2mNuFdUWJsH8w6l
         HnW/LRza2eAbovnzjXcLW5SA1BGlY4PY1yYNgXjjAd9TPl9wMTsl9Ulq2gzqA15ug7Wy
         u3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839147; x=1741443947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
        b=X/SerIQEVo25Gvll03gYdfgqpYXjDsBfjyTVMc1Kbi+baVp4xfVCBOr0cYNcQMOrmz
         anqX3kVf2wEhp46wR3T9ZV0fInRyxZY4zLRQnits2w1GB4BaAoCJS7IsY/2Wsu161wSI
         nuDQKvjde/nke73ubxVZqamH8nVy+O1HP0MV6Afyh+hpt9BSmCOy5Jgw9bf1rtnYikVn
         ueDcy9BNsobt9RDbLTojld2w3tqKmB52TXg/TNTNU7pNg49DLGjKaxLC7qQmZ3caoDae
         4EgM1gRy1SBB06xdj+ekaqec3xOaDsyx8U2BtfatiK44Jke7MXWcDFzz3yIkpwze05/m
         7TuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Q7sArrxuruGxRJhbFBTKuPOPB6QqYtwTJEmqLKHrReeEsub4gQz2+IcrLrmYsynPma66cd5eFqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhcNv3BKCaMSy43kxKGpTuZiyJyhfB4c635sX0yC0LIEPPOc2Q
	EsCWgAYiNxgB8QRdSrev3MS8nYzlsC9ROXZPY3LpB5RQ8NURuoMa
X-Gm-Gg: ASbGncs0er2+4aoI/t8Pq57u0mK8STmbnFjAHRkL8xTfBGfyyIPBlg6mW6jyFU2CtL5
	gWeBfe0UGIxDMUgoEMLJsyGFBxqoG+4jhGN0e4kjhEmo2OaCtpxwB4XKR9hjMxclFjNw5jjpL+e
	hL8rwO8Ydb9uLEsSqXe+smVcBdYoUcJGZHIpmvgixoNGl+fOWF6EcUVhc5RJB6E1eI+Y9tu34GP
	mN60sXP876Bi9e8Zn7v6LYJD+Gak9PopzwQ4RmcqEndpZcxdGba6qIPBQv9gfx/0Xz8BtADzALJ
	w4mnw4qzb8xq1caa3jGSMx9XjjMRDgwK8UJb6k59p4I0w/RfbwmQWMj+ntwGp4Ld8nopgUEU60o
	=
X-Google-Smtp-Source: AGHT+IG6ecfCPGcNZUMHBfcPl8yc5atQiQ27orXscqjAcai4Vvxl2x3xemsSJ5TeQh/ex0SazOZMFA==
X-Received: by 2002:a17:902:d48f:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22368fa8f1bmr107105175ad.25.1740839147356;
        Sat, 01 Mar 2025 06:25:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:46 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 03/18] bitops: Add parity16(), parity32(), and parity64() helpers
Date: Sat,  1 Mar 2025 22:23:54 +0800
Message-Id: <20250301142409.2513835-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce parity16(), parity32(), and parity64() functions for
computing parity on 16-bit, 32-bit, and 64-bit integers, respectively.
These functions use __builtin_parity() or __builtin_parityll() when
available, ensuring efficient computation. If the input is a
compile-time constant, they expand using the _parity_const() macro to
allow constant folding.

These additions provide parity computation helpers for larger integer
types, ensuring consistency and performance across different
bit-widths.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 4c307d9c1545..41e9e7fb894b 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -276,6 +276,69 @@ static inline __attribute_const__ int parity8(u8 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
+#ifndef _parity16
+static inline __attribute_const__ int _parity16(u16 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity16 - get the parity of an u16 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity16(u16 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity16(val);
+}
+
+#ifndef _parity32
+static inline __attribute_const__ int _parity32(u32 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity32(u32 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity32(val);
+}
+
+#ifndef _parity64
+static inline __attribute_const__ int _parity64(u64 val)
+{
+	return __builtin_parityll(val);
+}
+#endif
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity64(u64 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

