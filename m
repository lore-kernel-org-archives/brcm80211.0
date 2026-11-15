Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776590;
	b=CTvCSKPaoPrU0EOlZX0M3tQ7gokHykwdk0Tbo3dSu9N4Sd39qV9SPtyoXVxbZ2Ml2g5f
	 sXj1tinFlnMkEBlLFCYbNvg1qT0Ap7/HWyxCVArFXs3hqVQxfkE1iGdXvw0PXZCM+idwG
	 fTWDHWEi2EjpKyC/rn6U9Q2LRIqMl5QckqG9aTGRTHtG73L7GrtV4R1sHrRHcedlAnb9b
	 ryGF8yfvHiWdVJ38qWo1cemOlzP6K3h+VxlHTpjdOvJqmtlgs5L7t1fNiGc1J3Ci1tFJ6
	 OzOh7DV1ExfYseTZy/ljLM4GqpJ3eIuBayMk2veYsjFPenuFefRWcio/GxznhFD5DUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776590;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
	b=uqCM+l8RjkRO++/obiCy29lbal/RsDn72FY2YzVUhwfzyCvxCR0FnPsUBFI0nIJ7EDrw
	 YM0JtjUSYBcWXKVKVnve5MF6J+vbcklz9aNA2PhxH+K52hl1sdH6A/W1qvJlMSTwJbyBk
	 TcYo637XwIMX/Z9k3uS/KQ73SccpgsVFztwzV7rU+djA9NDDQO6JX2gAw3N75U0SqXPmJ
	 +k/pggug3z9hPjlG7YI0SX2cGpS1pHguGZgqYLtwBQAkkTfhQ828sp6TdtILD8lcb/3p9
	 72miaZ/lq42l0wDNN+hcfvb+aZu3bz75mXeZ1uPqSIroCs/YN04zh8TC+HB9dSVLv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="P/VHs2Rv";
	arc=none smtp.remote-ip=209.85.161.100
Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com [209.85.161.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D7606A333
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974D7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P/VHs2Rv
Received: by mail-oo1-f100.google.com with SMTP id 006d021491bc7-6b19e291cc6so3658682eaf.2
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776588; x=1795381388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
        b=w2sB9bdw0Vee3mVWQ0iI4n0rXEp6D1Rrs4QYkrxjrfDlo2cBr0oj1BU4wHHJDDT/cm
         U+SVuOdY7i+Ia61PrySA8ZHWzUvsCXZn18jCU2qOi67H9tnCtJhDQJ1IZPRw2h7Oitm/
         /4ZI+wQ+J4hUUpxGkf/+PuPdfNDiBQPilWWHZBXtIPvPnaQejkP+TU4bZtlXplN3Ek4k
         uwmrqZ6MNA2VS98IbXys5PjOoUD9D9rq8anGFffQQp6qT6fa5u03dF8r44Rl4vs3DyBz
         Xcff9m7OI4m7s4q1dHcUjmK2DOmQa7m+tCxHbaIwHp5Uj0oQUyJMoJrvgprO2crUzXqh
         ZPfw==
X-Forwarded-Encrypted: i=1; AL+hErFmaiewygXXVvgF/Cg4bX5mcnemCXybEObOoQoHbziwRZWRrdePS6zvsHbi+EgpwJS0LLYkdjwmed0=@lists.linux.dev
X-Gm-Message-State: APuU4Z++cAaBSacXTAXDuBARI5cvbcUoE96ciKEEpL4GeWH6qXRI/vaX
	6f5c+i3RVrnj3tLlYcaUpyCIirVik851qG6hIofVU5VxOSLWzlPGF20kVAFb8DztP6AIei7KJjO
	Z8C+b7BmpKel0jmc9UPO+xcnInXjOG4RdL0idEU7YleEfxr3qHpYr0qmj5c9XSeq8wa1cHII8kR
	77ZMaoZiSF4hYHdDuF+hvHZlm5XrbE5PAZgIKV7PGQU1afNNw9u0CAb2MM7725XbpU7ScPGvhAK
	AkBjMRaJtev3zY+PbQb5g==
X-Gm-Gg: AYBFou0Z7EucASpvX6oj83l/x5X64bspCHNDzJCOecO/mGp7Xkj/Q8QT5wvP9z6eKfC
	aEH7SwyMNUC8K6jMza1941Hbx8VIdqa66zAQ7jDluAnYcLDF/6Wt3PJbI1roe4rj3611NNOEip4
	Aw0yKXtvwcEPQIfuPQq964uwZ8zbHGHwnO5l1EXe7p9WgV2zKwz7/vh8kM833NTlEbrXBr5tvYG
	NA6+dtaeFrQHFmVeMWLVbNK/Yrza5cN8FwAp8FxnceO7f5bRcv2MZeR3XbPvKGr2w1MPvhN4eU1
	U0ehlqhDM2HUkvWBE+Uo2qgKzzKWlqED/SAQ7TqQsbeBlZuctKx774cLmEN3qQXyabZFHP0VcE+
	mcXmCYy7SrGJHSXXqNlnGm5PB4akLPwAIhxDnmp4fe25HpfWfzaiziZTwNWefUcuUKXUGHqaRd2
	xOqZvmtfQKocH4hf8ilbdLY43Nzxz0Rz1nzF7g0bluvg==
X-Received: by 2002:a05:6820:1c83:b0:71a:ea6a:4f65 with SMTP id 006d021491bc7-71aea6a57c6mr1684466eaf.23.1794776588475;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71af2064337sm7301eaf.10.2026.11.15.13.03.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37628596fc9so7597345eec.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776586; x=1795381386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
        b=P/VHs2RvrI6J5NaMT0a/p6hw3eeAKZgV4jVe1lXRqVDN9X74YiPF6Y8l7Qnkvt2ZlV
         8vYhO5yN9a5clQg7nHB/fsx3OPw3FZEbC6EPp1GUDv7kc9Vl9SPbwI1zzcZ0zi3Q/44n
         zug1MCPGmdR/8v0AFwLR/Ci1mWC2NbJjjTqEA=
X-Forwarded-Encrypted: i=1; AL+hErEHetj8g1OqVMSXuw6Ohoq520xUxjg79s81LVrCav2gpYFIo9KukBsObpndFFO8+RbU3QxcF9FyRyQ=@lists.linux.dev
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr10224685eec.21.1794776585832;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr10224666eec.21.1794776585241;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:04 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sergey Armodin <dolph-in@yandex.ru>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Angel Lindo <angellindo@gmail.com>
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: pcie: restore FEM control pin mode on Apple BCM43602
Date: Sun, 15 Nov 2026 22:02:51 +0100
Message-ID: <20261115210253.883721-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101172011.1591620-1-dolph-in@yandex.ru>
References: <20261101172011.1591620-1-dolph-in@yandex.ru>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 2 Nov 2026 00:20:11 +0700, Sergey Armodin <dolph-in@yandex.ru> wrote:
> On a MacBookPro14,3 with a BCM43602 (14e4:43ba, subsystem 106b:0173),
> 5 GHz stops working once the chip has been reset to its power-on
> state, which happens over S3 while running on battery.

[...]

> Set the bit, if it is clear, before downloading the firmware, but only
> for the MacBookPro13,3, MacBookPro14,2 and MacBookPro14,3 subsystem
> IDs.

[...]

> Tested-by: Angel Lindo <angellindo@gmail.com> # MacBookPro14,3
> Signed-off-by: Sergey Armodin <dolph-in@yandex.ru>
> Tested-by: BJ Hinkle <bjhinkle@gmail.com> # MacBookPro14,2
> Tested-by: Alex McCubbin <alex@mccubbin.info> # MacBookPro13,3
> ---
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
