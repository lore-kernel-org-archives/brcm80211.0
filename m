Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1814BFA2
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278379; cv=none; b=KhN/DOh3PyM6pdjQk/kjwaiasuAwAvqp6EzsKckp8y0uKNqQ//3Z7MDuIB+atPmN+YvaiZo6nWDgsX7XjZgCpBOJ3ZpCq81zh0QNHUn5il68bsaiMeeu5bxQHOIClXyb+bFPNcQeN5swL0YHbB6IS54+xe5B5DRIA89H06cg960=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278379; c=relaxed/simple;
	bh=CI2QBouZ2dkwbzeZblAU+6oACVJBoXLyg4YLH7XXZZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ve7biRGmESmhhEdNui++hKVwwu+ep+WdvxRV7KiEMEUQP9TCkZXAvaRC/wzgKWQyQutT4lFtTQNhkHpbYJ7qqyD5YgGNhc/XhQVGfpGYyjkufMOfBZO6s7i+zdC78cj0FSjFWb9pOdjYk02NBrwSZvYT6t5JCHSqJs1HUW6ulxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPtUSRST; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPtUSRST"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso1499870a91.1
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278377; x=1741883177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
        b=OPtUSRSTvlBQVw5KhkVrjCdYSlnUgjGXDtQtR5lw2JrwnrWGbY0SbD4jG9OWwvZzLW
         7TOPW+4LH7Nry+7DGj7abA6DR7Oep8tGzSf36rvVVqr+BWmdIORPc2Rzes/eXvMw/2j/
         Qyqa0P8kG0hhPqghzI2qjx/1OH8UlFji82Cyl3p95ECrIpOu/kvUFRoNDq7Ty0np1Prw
         Q6SHNOcf1MnraFhJpZm44Uxj8DkBoL+UAyfMh+23MEvLV+TGJzugtuAQ0+0WY2pqopxN
         1Ytjlsw4osQxocG5tg6RzqfwhWfojbf/SZLQFYXnX6t+LJg3gOYaZnayE7USv7pdL6gQ
         9Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278377; x=1741883177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
        b=vnT71YrAUXBKpuJhPdvaXMthz73SgSAns4KUzEEs9PLU8SXNDjySYz9PTMCr0bdBQb
         /R7rD31TDul+ljNwuu0zxgdg5u+UIdrm4jZHg/4UWfelHNJL9dI0rB5N4XoagOBcKU45
         sAxKbRju8Jt3Gg3kCL5cVQajlXQZBfUsYmvE30P9I5m+VSa5AkCc5Vm0mMrww3L7ASci
         /p9YZk3vw6fMF7H+Jqp3gHYTOW+YCEvnCN6EiS1oQ7ZECKAY+5ERjpqVl/rH4F2t62MP
         rWosQ4W8rmXnMM+j1Mk28RvSG26MGqO4b9cyS4YYHOu7riMlbl2Nc47X65uWur+ZTWGu
         LMQA==
X-Forwarded-Encrypted: i=1; AJvYcCXf2+r/C8nKS+d/DBhCmpfUSWkki49obu3JcEfhk5qdBws6BOG2Bh1wGgzCShLia54WT59dHWRNJck=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYlQrWHYROjzdhvsS5HvQ4eM5yyKRKl62GVl6VDAImEMzBIdxS
	Hg9+73lCNwdzQA4dB4461OlEwlJ1fPAdyGLbDOEqBX5wKoVAm2V2
X-Gm-Gg: ASbGncv9r0mBDFXs1iMcp2L9zCx63P7wGLLob2bmGrjdO4lyGdsCGfmoVNezwmf9DhP
	h5MSo2u3KtJ1ohEevsbXN2EZqYpzcHavf0fZ0JcPRvlw+RpCpFNdNhNxwKPxp8ZOozf/Gn2fUXQ
	BOnV9L3GN5dfNjiCuunyFd8YtKfvNe2tQ77h+ojIv/3l2mU7qRvezRGzjQTsumcZbk35IZyaOje
	+XWFg3yg1Idd8KykL/0/o4MW3N/CKs4PI/Fj7p9C5e/0/QO+8W7hG9c8JC6OhqP3cCzHqGp6nHV
	45uMnavumzeVuKkNL2XEW3N6iyVvAD7fwLPLr9mpVf1k54YUobdNwrUesp19HqHEmCus2rpN7xE
	=
X-Google-Smtp-Source: AGHT+IHz+gPXGVLABcu1Z5L/FQeF1foGDNMRW0PUwFQDBuhtYoYyf91GQ4fqN6r0d6c4jX9sVUpwVA==
X-Received: by 2002:a17:90b:264c:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2ff49753d20mr10753652a91.21.1741278377011;
        Thu, 06 Mar 2025 08:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:16 -0800 (PST)
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
Subject: [PATCH v3 02/16] bitops: Add parity16(), parity32(), and parity64() helpers
Date: Fri,  7 Mar 2025 00:25:27 +0800
Message-Id: <20250306162541.2633025-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parity16(), parity32(), and parity64() to compute the parity of
16-bit, 32-bit, and 64-bit values, respectively. Each function extends
parity8() by XOR-ing upper and lower halves, reducing the input size
progressively.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 44e5765b8bec..906757e1ddf8 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,48 @@ static inline __attribute_const__ bool parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity16 - get the parity of an u16 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

