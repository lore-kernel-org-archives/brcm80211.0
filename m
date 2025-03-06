Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B132222CE
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278518; cv=none; b=rB3l88ixSA5C8p76DPmhesxMCYqKte/L5Oo2mKy3No5Hffqy2VkRZCedClctnWD/x8ZkynYIZgZ4QI/Ui9xg9IUMhnvtO6QwBOutOl+ILq0LHpkjXGWKsl8TA/5KfcqqC5Wd+lpa5nd0oN3gUhRiI0+KkOEJ0CdPkKBL9mUxGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278518; c=relaxed/simple;
	bh=I6WJGZ+wmJHASMpeshHLkCaDYKparCJHsPTSZrYO2e4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NAKkn0IXk+fH7mF0e3MKn1G5n82SgRMZaU7GjN1xlUS5c05tcHsZCbYx8shOXPihRyImA6lpcb7z77kAz/S8JMNQxI0hOKFRplCuCUMAkDE1PQqew5RjrQ4cl7DCj09Jcf7V3GGaS+UkPGih1KmuB/U92eCrdTUgW3rvbMJnjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekHAJ60W; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekHAJ60W"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2feb91a25bdso1495424a91.1
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278517; x=1741883317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
        b=ekHAJ60WcV5oFkPYoi79z8Ln7+qMnUe7ku1VpGm2t5eyBxs2Bcw9Cmb7IenGTTfksm
         Xe9L092owxE4aEy39hQHw7JcdjCOepXceCPDVGLw91JPFbmryWCVdYa/aMmHg1bMUj7S
         P5NvCjG51C+8prjhyNBDasFD13dLOUJNwWGEPtekEbXVjUJton7QtgEragbcU37StUgb
         2Iq5r5EcDmTiIjG9N6h02YoW9doBNxWgqCFU03U0bMo5+u16wixzsf137A0ZzyRKmIrn
         zxMPf87xsCw+qhcyggAAmeukYXS0StQJjDPJw9DN8CxaqPVJyNH1/H0IVyuR2CtBEQkB
         UY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278517; x=1741883317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
        b=eCcIm523hJxqvW+k/UeIKZWgF2JB66mWebT5Ag03sxWXKvEkFRDhAQRlVyedMmYPbh
         sYH2ZVgqAzHb4oOd1WoxDmQGb11/BPnsMzuFQeDdvvXuQR1VFxXqYp29mCEgzHZlRFP8
         a9Q/NTidZFgM6s81sGrkGwNVzn+inEveoQwxyVVxjIp+9Y/A9M8j6q4Uzm8+yE9cgZcW
         +TqpaXYJP2csbbirxMwXxGk7rxWrgO4FH31BepdOCyWjOXkLQhYgTbMGysMY/69QOq+P
         cJCF+/6xQEDQSGeeWr/4a8j7puthohi7mybpF4JZtdVdnyf6dsys+NLTRH8xIF2LduJL
         ft6A==
X-Forwarded-Encrypted: i=1; AJvYcCVll1m1W7k09RZJQ3EFwTCxwwmkWEVKvKCSOaJCIJm0ITj8/uh96bG0vlZTtnVDvI6EaSthFUXRt6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZiHmszdZUD8X+hVtQY4AOAkn47BOvfbcaRdTHSjvU5p+Bse2a
	gGI+v5PTzq7OL1JwPluaRtHLtKwGtZLUfhQERXVk/WpoutxLxBrz
X-Gm-Gg: ASbGncstkgmjqRFR3h1g3RtmmUoMG64esn+E0WYi8OumaeU8Iu/4sL/phFizo6Kidln
	5Kufdy7zM8pub/1m/VK9dC/2QBX/sYgNf0UOvaSGVI8KAVjaO1PniNqOJuxXnCWbzsEgPXd7NQ5
	NY+1r3hbXAlrY967+qTyk5+5YhUhqg1FKuOKQFiPmj9cJHoBGSLTSU7kL8Zb8XiI44DRSsbQ36U
	a3wP0hJVLGofEfvOeLNafSF+zuuuqcKHcE1H3LT/6jCQ0jlOzgdQbtWtJQ1FOHhjWab7uMBJxsK
	50N4kJ6q/lgg3Ems72bbMpZVf2383Jof3Y4DQxnqJdxKP7dmv9xBF6MGTMrvQBWYc0Tzczq3ww4
	=
X-Google-Smtp-Source: AGHT+IEEoNncBZARV2kGM5Yy+T23A5PpEPT2NiyzW+biIXJ8M18fImFLR3KC2etUuhFwV9KdupSQZw==
X-Received: by 2002:a17:90b:1f88:b0:2fe:68a5:d84b with SMTP id 98e67ed59e1d1-2ff49716658mr11420319a91.1.1741278516777;
        Thu, 06 Mar 2025 08:28:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:36 -0800 (PST)
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
Subject: [PATCH v3 16/16] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:41 +0800
Message-Id: <20250306162541.2633025-17-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change parity64() to !!parity64().

 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..14306f128497 100644
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
+		ecc |= !!parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

