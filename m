Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A11E0E01
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839201; cv=none; b=l1w2athEibW7TUEaLbKZMTPQjL+q+omirhkMgm37lDUloRtaBbstVOE9tpX/pqEUmu2BznvkY82Z433oUjRFEVJ9/KTFfrXwoA0a2yelqYg0JfqBcbWMcI+bEYPrYWlTAMZD3MOu2J/9fCNRFnj3Bv07SXD5ifkoG8DfO2P279g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839201; c=relaxed/simple;
	bh=HKAn3f+7sbHTTp+UNFXBUa/TbF/WrljtWVRMW4BZHbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nhLhi06F6Qo+D/m0eyseYg7qO880H0Jyx6+ESBe+BtdvQEhVwuQWK9Z66N2pckvGBu+dGrowuubxG40yiWal4QiXV1sjIE86Sc7IHJBB28UWB8vKIO8A25cr+IWLX3rR5Uxnun/D+z368ibQoabzez2w2/l8llVZ6Qtym1f/56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJaWKbne; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJaWKbne"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239c066347so1364395ad.2
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839199; x=1741443999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=BJaWKbne01hHVrmgshezwpcCGPCfPhCeiwz01HvkFOAAZF1ybSEDHbF16pHfB464ek
         Yya2fnIfFGOwZLc9eBwtXXpLA6J0JJAWVwQa4GQoa2Udc6TNdBcjJWzUdKNLEGsLSgEd
         Ygjp97pmugfhf6VoZsV0DonZB+qK0ZCnUf0K+Qne0o0IFQbrZhMI1YVerD2m99QWJhAI
         n0MnrzGkZKNL/A+2VAsDGF9oTUc0X/Ttm/Pe6W0E7SK7YbJjRcmNqYUR9FVT7gxF3Y4T
         pa0o8WPiKXhnMhwtj8HGBhZ9TpQlq5BfLwu9WnANdBBjt3XPrFfRlJxF1URGmse1VdM7
         kdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839199; x=1741443999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=gQeT5vrVn2Hn5xIa/eOXhrkMwBSc0Kc6526e/sYVA61gZQoiBwATguB5aq8Is8J6ga
         UKsbE7iiDyVAgYHq0CLmAS/Yd4dNIYQiYNxmIOUhVsmu93ptPT4TuNO7sGzpwbeh4AN2
         fptfcgWs7GdVp1FT5DDLMlQOn6TfYThaUExpw2boOZuYw85AztDZ2W0WeiMOOlncpltd
         ltVeYhbcldVQVN+CW98+6OORcBVoqz6J0VOqsXxnVigPZqM6R4OxSih/gMtTvml42Cgu
         1bPZXf1X7du8gvfg3BEw2m7mnpvI4BxmV2LoCk4En/6AUFSplwYBBpzJjVj01Z6XPyLE
         F+uw==
X-Forwarded-Encrypted: i=1; AJvYcCVHpgk9ERtivsLmU+HMfz+5xhhPU3ItBHcx5oxLqA+8wMzLTkJkvShqPCt42L4mjN/m8octUeeYfcA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCpHijlDx/kYl9KZ1+d+ceWp0pin++t7CiZEHsDgMBi3klpEPW
	TwAGcWDfPbbYUC5NLPI8OrW2LpGhEnDlvNGaFCT0PHch4aEEk0Ue
X-Gm-Gg: ASbGncvX2jXPYs6K57klN2YG2dM7aysFPoBkWS5oDiqilWxsfNOwMlE0GFJgs4YnWjE
	jVNhcDnbLgx45HuyMAd31m3Fh9dZ6RwZWI2d/28u2wy+ir39KWVIb6OiA9ooc0z6wAYsq5vD/IR
	N7L2neQtGIeGp9g1gQHmiCghZRGU9MpA6UAZ3Sb6ZE+Dr78IpVoYeRDGkBG7uFkPMfigHjKhAnW
	z328PKQcKkjD3/STpsrU4+/W0GyN3KnkRWh8hfBdezuIsKrjTbv7UyZ8kxe89MJ/NIov/7dWZ1e
	qZpVDlIG0RbRH21Mj06C60/xQqkqMkZ/zY7i2sMTajAoznPh3e5vLlS68NyhjowsyMeokRiMvPQ
	=
X-Google-Smtp-Source: AGHT+IF0PsFOHNYq2JTljPhmrhYVkAKjdgh1XZeXstNsMDq6/4mtC72Fp39DdqLibOGQ7FEZk2iiHA==
X-Received: by 2002:a17:902:da8d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22369260956mr94926455ad.47.1740839199131;
        Sat, 01 Mar 2025 06:26:39 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:38 -0800 (PST)
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
Subject: [PATCH v2 08/18] lib/bch: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:23:59 +0800
Message-Id: <20250301142409.2513835-9-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..769459749982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

