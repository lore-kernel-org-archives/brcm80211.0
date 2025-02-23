Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E55A95C
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328983; cv=none; b=qdOwkN9fbSQGbZD0tNjTMkmNjqTX32VbUVcW80wfOVigKnzDZQWtfrm+Ib0QEHgupnguHSgt/buWqyC4gxuyqzg1i4gsvAujkPdrZW9Z2jBAeqXSUdBMnmMg6SIcC34+va7Xl7ajEsmvkQT8NWLO+gTna9TujfqwwZwXyeQbHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328983; c=relaxed/simple;
	bh=hSOjgUw8pInTvIwc3Vx2Sv+ma38FohsXF5UBIlyo008=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=St1Chg2RH5SY/LkOmwztshAExH4oJpnByxKNFSRsRWm4ySbYr/DIN50PnX7vLRupgWujWNtuhfIXxtWssmDzYYopVqWbqEKR/qLtmjCRDnWmCORTk6S1eIWEor5VPWC+Wo827bhpXGWU0cOJ0WMwT7tGta3smXJs4M0ZpgHVvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fleacBbr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fleacBbr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fc11834404so5633263a91.0
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328982; x=1740933782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
        b=fleacBbr261UAX3TRjqRV42Jvh7af03qYOkSOw9/M0skmqqa1iVwkOopr04mfh97hM
         dy8fFp96aq+pq2a9zyirNYgnz5X7A0nIN0Pbs0JF9ypGY4fsTD/hvJ9wbFIAL5jd3xFz
         ER+lGOGqUy1z7IeVAoCqJ9NkhrTjmXeSnpq3vFk016xv0Mi6Balu2WcP46kJ5XyZI2X9
         UR14+Z5UIfsQT/vjP8Eq+LkMXdFHm0zr82xYYlSISbYh+fBGF6nZyQvw6AZ9CVGRYNde
         aydYBS3H1EHhapqGFkV+ITQ7wBpD2EqsdMsmzUJfT+yLFBy676zZfDhvdvVXogcmYslc
         LISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328982; x=1740933782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
        b=bmlFaGVp2+1Es80i5kD1Kpyf8f1dwsbewCZqYge0Cfpkc4LsiW9KSoUyW5xQDOPPKY
         i2X9tI9DIcir5giwIl8KNqeW2QwOKnNSrFVtFfqlxMuzpK6a0zTup3BuHCpJACk3IcEj
         LsYFPkTNIT+RR8W2n0DMnmdUgUH4hnxxrz9FZiYqy9YzNIkyhUlDdRiF1gFAbDy+f6ry
         14biwpCVtBmr9lSiZy92K80z5oeW4gX+jyqp1CYUKW+scvSBJpVLHZXwMhOdZLBlzD12
         qVONvO6BlYfyO518BGO2kDHh5l+Uo5K4BBTAxO/gQgRFR1Te0sAS+zVvOFfok+caXukN
         /yfw==
X-Forwarded-Encrypted: i=1; AJvYcCUvLrCqdcKlMeo5QXAHhAy1LlnL79K2E707dZKfJT0o/efR207uNOBw4xE9tBoUZ5FJfkFZTKpxMYU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws8c+4XeemGsq+7RPik4JppyODtJzthfLQFuefuQsbMJAKcb6O
	+scSFNStszLgn4182XDA6PsWjmKJRXM/VqlVGKs7tVSsKMEuQrXV
X-Gm-Gg: ASbGncthw3Wj+DwXwNPdjCn2N1JVFjGtyM8knqGhyi4flw/uzV7IjcCY3KBz2B+TUbS
	f0ZS0OjZiNXOOi+4RS9S9H07pq7kMQI3TN9nkJjuh41Xhbr5IpEEPHb2Nu+x/yRlTwh7S57ZHT6
	HiDZsrDtCGzweYSIkKfbMJLqLMRNhGchk9ba9gyaqjTPKX33NJoxZoL8DCx8zseNjI7ZTAg0R73
	DgDJetc82ANHhQG28LL821HOO4piF3CPezJEDdIzhAr0KkE1I/iieNxSKvf9ht3MndzFC16z7kt
	izHiEJoZHOFpVIVJO+8Qjqb4Al+bBtlopMUnM9qIuhY4Fu3qsloDOU99
X-Google-Smtp-Source: AGHT+IHY182dhZjo+LBq9qsTP5GtRPKleXwf977mCGplhz7BFQQV3AK7mJ142hsRvikrULeBFmErJw==
X-Received: by 2002:a17:90b:4b90:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2fce86b31cdmr16578615a91.13.1740328981599;
        Sun, 23 Feb 2025 08:43:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:01 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 01/17] bitops: Add generic parity calculation for u32
Date: Mon, 24 Feb 2025 00:42:01 +0800
Message-Id: <20250223164217.2139331-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity32() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..fb13dedad7aa 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,27 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity32(u32 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

