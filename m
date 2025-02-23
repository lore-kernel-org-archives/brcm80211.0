Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCF189528
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329160; cv=none; b=rwHHZ7xsnqwIMx7tsNGj5pwEEVJGnQXuDtRCUGuy3+INPJE0f4LzIYfqKN2+P3eeFZ1poczj68QVgn/oJmJYvmoXZn0HXKMuxR5Dne0kGaEwOgQjWOzSJF2UqJE31hfVf9xnJpuHfY0uhrw9SMBB+bPcJqEBm2T9sqtvKjXtbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329160; c=relaxed/simple;
	bh=VpxAbF0iBul4Uw/Lq+mofgkf8czO0+orTD3RsRZ9cYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CKoDvYpGlME5HH4x/3ueOzqJ47bNM+8hEBO8S63bZmigIQX9Ryud+HcLo0PoJtKwr1H+SHGh2A76u9n5wXIKUl0jk/qB307913/GuFTH1pjbGy2M5zNu3Y+e/ubtVn2PoGvDsce52aboTBRdRcl5E/erOHf4RtnCB86BEC6MXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsiVATXU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsiVATXU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa48404207so7516113a91.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329158; x=1740933958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=dsiVATXUR6XWmOjN6sm2OUbXitHcBrqgW4dDFhcQl7R/4E1hJgxOMRmtMA8y3AGXVT
         m/UqBhAMD6hyTMzucn5R5SoKJyTAF5OD2fzCDa9c+0qhxzzjG0LxR9Z5Irk3weO4Cfkk
         /z/NfaBh4VLzi8mIWw3VLOhjXtB5paTVvL6xO86HgrBS8i+Bz5YHeZXa9G167SLLPzlz
         OSTYIwCsS7GNZdKmnzA5WHGJcga8ZHYNzX8t2ET2XdNq+5ioyyTl9lUsAP99JuC48+lo
         zkENqw0boSChlr/C10DIAY6vYQtdgQncRQ1ywaV3ubp+A118wZqXWmaY5OkAWcAhYnoj
         NYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329158; x=1740933958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=tXm5G4MJlYA+dCOR3zzo4p4TJHTte0KL1uhfuIQGmOysGSWi72lr6XXQujTheUYdt5
         OGBg5g5B5pdJt25JaGC2ecutT5Z+pTw7/aWcf+sPSMjl4Jum/8oWVqns9ZIlb0j05rHx
         ZoLpL+dVtPnWWJWBTnYCZTSvMvFE32hUD0Jb45pAboUCMfqqGTuv3CzfCWo/LHor8kfL
         6SCcp2cUm0fi/XjdNoYS4tfarkBiYhujTtPYPMzmsk9bHmLvQl74W81iU90FkFz45p1v
         9yEZiTieR0ZHR14eXV/09norC+LlbXDl+ra97FCzqcafi/otdbJ+msxyJolL2rwbJ9a3
         VJzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmJX+0ER4M+mUPNuWdcD/RN2noB41Aa+tymrSeDj6H19RcHbJbReZSguuHjGaPRrxQp6PwBdmRMoQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpOQ2F7Pkwdh3887t1cx+mMeGyAH123rIh2dEZ7WIe+s0KWrjb
	FwtNudQ5jIAsApsZMQHicZOdhsAjWYVl90H4cXYCuhW2ZFxl+Gfk
X-Gm-Gg: ASbGncvWsqegqSVBj7Ctm1tDPzV6D2kOkCxAgRJvC3SwVvJyPLnwHicEmvwVAwfLY6I
	jKHXOs/zJHR13XSH9yQHta3kGFQxpjxP+Fj5jAon6zdLq5cBTS4TMfiuuiZ3Am57GCOXu9OIdq3
	UzFSTvheXt59UlTJ4V7TR4AxiT7EMRNSAZxTHBSKB135axfeKx1qkDT0Rh26ylTjhEnhAhUwu2c
	PJUS2CBuPCdDKQ1nNmYR0ezFejPKFKnaD3lKKgFzSKw0HE27qLxSCe0ZOZ+/YGh2neAesoYHa70
	yqUX+7Rjvm1InRTnCGrzHXqd7YVtThoe4V/ZA6SDEyiTQS9DvFK5Rc+1
X-Google-Smtp-Source: AGHT+IF16AG7QV3yDJH/B6gDeFm18hoNJMWrJMQH/o1eQGkDQfNTajRN2mVaQtR8BSlGLJjsCZspog==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id 98e67ed59e1d1-2fce7b0acaamr15082851a91.23.1740329158110;
        Sun, 23 Feb 2025 08:45:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:57 -0800 (PST)
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
Subject: [PATCH 17/17] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:17 +0800
Message-Id: <20250223164217.2139331-18-visitorckw@gmail.com>
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

