Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B91F3D45
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740425229; cv=none; b=vAmXf7T+uWGfrAmlu3rsaa0qDyK3J1yU2L44MFhZmm7lW+Hx50sEXoUCw6cKZ9VJQZ4YY7JA7HAv7cPFtDQpSQT+KDnc3QWy8Q9zBpOzxi6oXFuTQVuZqerLHcpZFAnA/dkYjH/QUPTmsJZQ35/M6du8uLxZzUXJ9+L4Yqu5kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740425229; c=relaxed/simple;
	bh=zms8AwfScWDNRnCzKtbTRceK4ozgPM3XizahJfE+6tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7GhyiyUVnT1yRTNL9fMSdPDqtmE9zMWFrlg0KRKnm9PPQpJZhIHWjqiiX++MNWCV3jyhJ7jYg+G7UYOxbFpFrKrbHuj95Fbu+UW+mAa7vxz19h1b1JcVs0m9kSi1DXYKuTympQXLNUqXnr1Y/KeBZBQapdbt+ypynVFUv93Eag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsFOMPdU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsFOMPdU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso9656067a91.0
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 11:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740425227; x=1741030027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNLdUwijT6W41ZsoblnFA+2AFZPup2ylwdIktRpNhS8=;
        b=MsFOMPdUFtKFtcDnLGlHIPkeVYwJ3CGmb5MAnu47WhbB+HsGC6ZUIIJw1Yvjhc9jHl
         2YjXy003WA6TP5QVyL+cGtWs+WtcWB6AUI5MeZgSfHqpusKUdql96UI0SYB2oLiSsncy
         Qw5Ccrbq2OHRjA82eeFlgiIga+PEgLfGFFRbTlzlCcoTVHtn0zUCSOHrzWiK9772h46u
         7TOxaM6Z9VYTVwJgvwBZHEvC6bLVhhnfpN8lM478aMMQrdAfC1wn2G0u3PkCaewXQ+8E
         zfFKbdoe1cgciCR4VFrbJ3l1LspYpZM+uH+ObO9ZeU0hAiB5qcxYIdK9rddackSKOU24
         r9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740425227; x=1741030027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNLdUwijT6W41ZsoblnFA+2AFZPup2ylwdIktRpNhS8=;
        b=kxvjyxB7JhxZR4fiuYy2HaiBW8mEAODcUs1VnH6X5KTrpEOHr/b1bEqTnOiEsmkAxb
         rjjQK2EmJhK6s31aF8BpS0aoLMYeegnaEFIbVTJhIt3TziWQtE2xVyT6zAy1c73w5/aO
         83fk/rw+TjkryPovUCI0V5p9d3UmVaRGgGRIWE8AiT707K9+DToxYl1+TlGrm0Xq/zb0
         0PkzTgqG/C+kKmkNa60ll03coiQVJBr9a6Avv0W6FULwS8OXSJZBkzoN5/raHNLGt7Fn
         7PHeYdGBhScc0tP2ZWPe8w4fH9CGEDDgk3GlyQwHsrl4t2NH6zIXpqctn4KtCa00M0P5
         xYAA==
X-Forwarded-Encrypted: i=1; AJvYcCWx6Y2XI9TACebWIE2hCrcYvg+2+2rOfdhF6qvIJJOIEB7wYO+R17MK+RuHPTe41T416X+HA1LPUwg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0nD+PF1SgjI9XYPUNzdCK7nuuovk1MSXLIF2VGqkefdjIH84Z
	gS/oVkn1EWfhH8UoPe83c9zPxqKIajl6AvuWc0orG0vqVVaqWmmq
X-Gm-Gg: ASbGncsCrjlCB1lcIG+eevDibzot2gsb47+W2uGj+HMANS3ydqTHaN2vaOEZkQD3dy7
	/qwiJDmo9DcRAag6L06M9Iy9PmqmDiTOJiEIRPCV8dHMOfXsX5/iZLBDCSHgm6scgdsDk0atlcs
	LHmDUXThxjd3OIMAQs0KhUhFUigpPfTXAZKd674JYOqZKurlKGNgI8zy0/9cVlzZwuSzz82ORkR
	zJwnJ4slP2mWPGeCBElLigAdBfH8GluXMZNcz6tPC/j1rY0wzi2LkP/3K6gofWclArhxmgzQPc5
	FY2TBRpKl51eQ3nJezfVeW50qbzmTWMwnNEvn2uhNAm7MS3JaQ==
X-Google-Smtp-Source: AGHT+IH68TTuhENvYMBVibjVTmGrUAIBmwlMSF4lzlrMkZQD90CN6i4oKdfqdXSCYQRlTI+LIK96VA==
X-Received: by 2002:a17:90b:38ca:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-2fce86cf118mr21465186a91.19.1740425226496;
        Mon, 24 Feb 2025 11:27:06 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3da759sm31947a91.13.2025.02.24.11.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:27:05 -0800 (PST)
Date: Mon, 24 Feb 2025 14:27:03 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z7zIBwH4aUA7G9MY@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223164217.2139331-3-visitorckw@gmail.com>

On Mon, Feb 24, 2025 at 12:42:02AM +0800, Kuan-Wei Chiu wrote:
> Several parts of the kernel open-code parity calculations using
> different methods. Add a generic parity64() helper implemented with the
> same efficient approach as parity8().

No reason to add parity32() and parity64() in separate patches
 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index fb13dedad7aa..67677057f5e2 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
>  
> +/**
> + * parity64 - get the parity of an u64 value
> + * @value: the value to be examined
> + *
> + * Determine the parity of the u64 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity
> + */
> +static inline int parity64(u64 val)
> +{
> +	/*
> +	 * One explanation of this algorithm:
> +	 * https://funloop.org/codex/problem/parity/README.html

This is already referenced in sources. No need to spread it for more.

> +	 */
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;

It's better to avoid duplicating the same logic again and again.

> +}
> +

So maybe make it a macro?


From f17a28ae3429f49825d65ebc0f7717c6a191a3e2 Mon Sep 17 00:00:00 2001
From: Yury Norov <yury.norov@gmail.com>
Date: Mon, 24 Feb 2025 14:14:27 -0500
Subject: [PATCH] bitops: generalize parity8()

The generic parity calculation approach may be easily generalized for
other standard types. Do that and drop sub-optimal implementation of
parity calculation in x86 code.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 arch/x86/kernel/bootflag.c | 14 +-----------
 include/linux/bitops.h     | 47 +++++++++++++++++++++++++++-----------
 2 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 3fed7ae58b60..4a85c69a28f8 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -2,6 +2,7 @@
 /*
  *	Implement 'Simple Boot Flag Specification 2.0'
  */
+#include <linux/bitops.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -20,19 +21,6 @@
 
 int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
 
-static int __init parity(u8 v)
-{
-	int x = 0;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		x ^= (v & 1);
-		v >>= 1;
-	}
-
-	return x;
-}
-
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..29601434f5f4 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -230,10 +230,10 @@ static inline int get_count_order_long(unsigned long l)
 }
 
 /**
- * parity8 - get the parity of an u8 value
+ * parity - get the parity of a value
  * @value: the value to be examined
  *
- * Determine the parity of the u8 argument.
+ * Determine parity of the argument.
  *
  * Returns:
  * 0 for even parity, 1 for odd parity
@@ -241,24 +241,45 @@ static inline int get_count_order_long(unsigned long l)
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity(val) == 1)
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (parity(val) == 0)
  *		val ^= BIT(7);
+ *
+ * One explanation of this algorithm:
+ * https://funloop.org/codex/problem/parity/README.html
  */
-static inline int parity8(u8 val)
-{
-	/*
-	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
-	 */
-	val ^= val >> 4;
-	return (0x6996 >> (val & 0xf)) & 1;
-}
+#define parity(val)					\
+({							\
+	u64 __v = (val);				\
+	int __ret;					\
+	switch (BITS_PER_TYPE(val)) {			\
+	case 64:					\
+		__v ^= __v >> 32;			\
+		fallthrough;				\
+	case 32:					\
+		__v ^= __v >> 16;			\
+		fallthrough;				\
+	case 16:					\
+		__v ^= __v >> 8;			\
+		fallthrough;				\
+	case 8:						\
+		__v ^= __v >> 4;			\
+		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
+		break;					\
+	default:					\
+		BUILD_BUG();				\
+	}						\
+	__ret;						\
+})
+
+#define parity8(val)	parity((u8)(val))
+#define parity32(val)	parity((u32)(val))
+#define parity64(val)	parity((u64)(val))
 
 /**
  * __ffs64 - find first set bit in a 64 bit word
-- 
2.43.0

