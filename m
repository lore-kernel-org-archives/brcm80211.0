Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E421930B
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278369; cv=none; b=cywCijkqNQARZ/lXBaqxE+JIOdcTbzRvZZ/XYqcTQX6Tm20FzRNTEj8DFnXla2nc0F/fMQaiAkBadUVoKh4dDsQdtf9uS5LG05JOJbh/jshDSSktwpmMftCgMgFUp12xOF9o0jCC4L3ViaqmNr4FWJza6XS9w71TabmPNQG1nJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278369; c=relaxed/simple;
	bh=rGHJGCWU1PTrVgW6elmt7hoIQUKwiu2qrB2w4H98De4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOCDTDctynSC3Z9wqQpWltlpfdBBCN9GbiI5nQad36xFk4vjy7VCpCrKuEwsXzbu4T21zVvfR6aKXgBiPzbAEsBTtZVcLXeDDyR/U/nmCfGRfjY3UG8gab6SUrs+ixlXoEM98uj5xjoeCAsPdNnBfSbzrdpfY3NX6B9/TmrcXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPmVPK1I; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPmVPK1I"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fea8d8c322so2025754a91.2
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278367; x=1741883167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
        b=DPmVPK1IO1ThAhyZUSipgriMP/r8ueJmoNQiiAiyROCVJjH6mLb/35P3iAt9Y44w+E
         RDIkcPIcB6OO7LEkOpAIZhPQsYN1xhGRSh1MxHLKZgS8rsAwGxRT+Dhc0JfyIAVhZ4Ly
         OSKNwDJwf6OwD97sEMgc+/pHQRLUqcWLnEdskWAIMJKzRLBR1TAHs9UK+8jR4gzfxXSZ
         fVYyTAlaJdM2zK3dGDQswnZpnK+WhVnFTcyUXCIT0I5W9yJzrIZ6unbnHpeyUzKy4nVD
         BODizUtATM12g5b8f9VN7lnIHyBO7VioviVFO+zT960FgdE7nG9Ij9ZdeoS5l4F/dZfE
         pcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278367; x=1741883167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
        b=v8WjbpvxiWbdEgmY2RCmluN9xol1i6HZ7Q51fsO+V2P+nLLS+3XxrQtkZ2Qp5+Gi5J
         OS11CAclbcUoPb3JwzrU7GAaCtz3xbj5qIGRlN2Z7oqv0gZEHgp4d7IUmZjYbqZCNqkX
         LzLwZmwDCyVrX7MM0O9MLCLeb2a5U9pAFMUv/rMJHmn5CcDTMyedaKI81Y+qeeyfX2I7
         EYQIYUVIFvCmptn50fP/aODqNhqan9O2gIIY4UoNob4ZbKLb5EHjFjB8jGps/TLD8s1d
         BhPGwIjTLacch+BoAWfxXX+Ss/NgdI6+5dQIWZKOgCwZ8l3htjp4rIwHv6wOH3ZCdVmY
         akBg==
X-Forwarded-Encrypted: i=1; AJvYcCVxafxRdZA+4mzgnfmwRU0/XVN7mlru1w+gXkPFB7FLZ7PyaHZUcU53GZXCEMGcWkmG63SKoQHPtUw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Njb5fQ5ufFBajjAOeQyCQUnxd3SrUGdBNtKzKYWFf8ndB6r4
	Of4+7G0DX/LqkohTKLkiim+4T6h+19taiJFHo16zmmNiXKgFDF8w
X-Gm-Gg: ASbGncs2bi1/Xcsep+5Wap21aJkZMJh1AGedw3HAPk9I3iwxEmDbROLHgFc63u87zdq
	b6ZFpTHbbfi1KUGVvGZ0voKjy+tWl3F8qsHbWZ1Z2K5JiwH6cWVjmMiBgM3tY3dGFcSNMCcDvZK
	kNtuba13jDwiLirH7ndpvpfFuD4p854A2DJuBRys1mEx44wqMD5nBdPC6azpo7hvBFKGFRdFOc/
	acxbM7n6S4TYDyz3IL1mAsl1tqCHYKhZbZdL3n/IFmtlwjc0geMFALlcVH3nIorQ9XlaoHedvqb
	+WAaVwDS/FtXq9BeNRR/TukClAX09uhJNgfo2fgry/wTFYFdz56T6BTaR2WNFT18NWyg6nlX8Js
	=
X-Google-Smtp-Source: AGHT+IFHH+1zpB7N9XuTVJAOvoyUY8hkKo2wZOm3e52unMZzsjH5Hx1bGZW2MZ4mGhzudOerhh255w==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-2ff7b28a652mr259914a91.34.1741278367078;
        Thu, 06 Mar 2025 08:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:06 -0800 (PST)
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
Subject: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Date: Fri,  7 Mar 2025 00:25:26 +0800
Message-Id: <20250306162541.2633025-2-visitorckw@gmail.com>
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

Change return type to bool for better clarity. Update the kernel doc
comment accordingly, including fixing "@value" to "@val" and adjusting
examples. Also mark the function with __attribute_const__ to allow
potential compiler optimizations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..44e5765b8bec 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
 
 /**
  * parity8 - get the parity of an u8 value
- * @value: the value to be examined
+ * @val: the value to be examined
  *
  * Determine the parity of the u8 argument.
  *
  * Returns:
- * 0 for even parity, 1 for odd parity
+ * false for even parity, true for odd parity
  *
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity8(val) == true)
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (parity8(val) == false)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ bool parity8(u8 val)
 {
 	/*
 	 * One explanation of this algorithm:
-- 
2.34.1

