Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953B1DF755
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839294; cv=none; b=ldMxWL4yZn8lRsi130p9un0LUiInR/nmXk3aWdxfF377b09YlcsvETrtmhnON83Ylfn1CNmIweKayL1Nt4PFDAGUhGPSljyHyO72+NJjh9iqklvBmFUgNB//CKJtGceaN7YYpt5o21i/3gnffDpElCogUGbUVA0NKbAccQQ6tZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839294; c=relaxed/simple;
	bh=VpxAbF0iBul4Uw/Lq+mofgkf8czO0+orTD3RsRZ9cYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=at8cy7kAGT0WiDUKIATPaYmmOWZWO0c1Uz4KSF18RkaTBiDGCSam/si+lRyzLosYIZC7wZxluUuF9pShTw+j+HXohrdfupG/5AXvdwdvWZ2EGTj0MeukCtcCx4+1kKNnyCCiwa34VBRO+E/F++SsManfdjm3aC6wUAG9tpW4tHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDJILduF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDJILduF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22356471820so48813205ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839292; x=1741444092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=IDJILduFqGgCwbM4Qzf5znAPZhd1W+bBp8KCH0UTYyGAtaHyk7+kBHKvTa//rKAX9m
         uqARJZtRjqghj2nfFAZsxHKpQOnT1ygTRicW+jOaUL/PF4v8BFF+hhgtIAp7cRnb3Zt0
         8+4TFlqsqtmdhExfREgTE91vLfNFagqaZVdTwgm0VoPkXlcWNFBSQfa1V1/KqcjV996N
         IUecV2/8TI2puwxMgKUmMf6oCy51HC4T/B9kao0OpKTHV+w56i6FlYU81rM/m1aQh3u5
         BR/y1x0DG4AED1iaKewuv0vjuCpexQtAeeXH+78sPd9LEbwnzhhvDbBQAjfXi2ZGW5DO
         pbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839292; x=1741444092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=eQCPaoAWVXmv/6qXytg7vik91vAPAvPFUZm7vyqvoPQGjL0DMNkKGdaxlIKehW78L6
         4oFhNzgvdp+bsG3wDU/iQmOlrUn8KKwRt4NRPYY+C2MDpm2AJN6InDPnxr5jFQFUNFQl
         hHDSjUwI8ea1c6Tvu5BbBWeKcMVt8DGKtYzhseGoPv/IJ7OK14d+iSN87txvcXcRF8+v
         mhk4ega+qeu2wWYOP8kb0xCfLZQxLG5Q9A1TujW24NBVXnOuqa5tsKEg2jjiuIm8AzLm
         zt8yxbOUjF9GwuoiGpuVCvjdY6Ij+EtM/xd/HM0vqvI91jt6wPKBSWVAMdXN6fNk2pAu
         VifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEfVnScuzmpCd4SCpz1NAhBqGE5a5CuVxbnuG9DBCFRGMlAvNAKdZhtSXoyThbuuFy/UqTPbY4K6U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj8Pjj9qDl7kC9nxxt1XIpSduoev+I6Lq+71jm5QquR7ta5c7P
	dW4l3pQL6XiniIb4H+h07YTaVP1GicabKZZ3FL1lNY9ubopJ0McP
X-Gm-Gg: ASbGncs2Y7fP+ZlTrPwLJJxNssIDeO5EKwzWH4o/zVrTWo4VJsO7CpncqHgqm75XHnC
	TfJf3b3jxoaXMjwMO7SOj+r1FI1We7nSoGy+reruxpNO8eEga6EFtk7qkZLWYojuViZiAeRN8Xf
	HsmQNE+89GUl9s8n2Dih8WeDFzFq+t0shZvt7b+15dJN9X/I3Jzi+pC3LRRD+vh1YcpvnjceGiP
	W4vF5RbbVBMcqR9wQEyWXXTB6polHAuK3oXzKGf4fBTb4CR8DWuHRgseovzlPxS4VgXeVBBs02i
	hHSm4iiOcJEGxXZ2mok4u3YWJGX7NoSItVDk4/9fVYzbRob2nKvDiqoARIRlmCEi22OFanIsr2Q
	=
X-Google-Smtp-Source: AGHT+IHOy6Wv/sKHhRUGc/3EBAQcCBF/SI4YUeW7LDGDR7+GStKywND2M264p9e2dxtzneP/WiNrxQ==
X-Received: by 2002:a17:903:fa5:b0:220:f40c:71e9 with SMTP id d9443c01a7336-22368f71f0dmr96371785ad.9.1740839291945;
        Sat, 01 Mar 2025 06:28:11 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:11 -0800 (PST)
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
Subject: [PATCH v2 17/18] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:08 +0800
Message-Id: <20250301142409.2513835-18-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..3646f84a6e8c 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_asm.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
@@ -295,11 +295,6 @@ static const u64 nfp_ustore_ecc_polynomials[NFP_USTORE_ECC_POLY_WORDS] = {
 	0x0daf69a46910ULL,
 };
 
-static bool parity(u64 value)
-{
-	return hweight64(value) & 1;
-}
-
 int nfp_ustore_check_valid_no_ecc(u64 insn)
 {
 	if (insn & ~GENMASK_ULL(NFP_USTORE_OP_BITS, 0))
@@ -314,7 +309,7 @@ u64 nfp_ustore_calc_ecc_insn(u64 insn)
 	int i;
 
 	for (i = 0; i < NFP_USTORE_ECC_POLY_WORDS; i++)
-		ecc |= parity(nfp_ustore_ecc_polynomials[i] & insn) << i;
+		ecc |= parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

