Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036195;
	b=uxHBhWkXrLA89Ot4GEXpRtekzv8T6m3TE5fDRmsUpT5+VJTP7H/pQKWD8dmLM6Xv74C1
	 Z4KlHifHeUlsvhPrDdRnB+9tfIAfY/5+uGHSP4UvpsmjF9/+2TuOgKZmouQqBCSYUKZ23
	 16eRXvByZ7bE9W1hhUfaRbARJY/QJ1eyopCtz83pBevt2bsMguFURnqAUAkMcNz6BbQ9m
	 p+IdeUZAjt4bfh8FSt8p/Dz3vKCfM6/+SK5sEeAXwzBUaOzPJiHkVY9XpKty5MjNXW070
	 VMVsGAO+QyWSVQ+imK3uNE2YWUOd0qU1Cx9Pdma24yS7xJy3SWwDWss4sxDhRE6Cqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036195;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
	b=udI9h9sLd46IRZ/AwU8Thxc0qlGIbuWpjPTa9zCxNZ5axqahVWeMexGgRnm7HUjYK85u
	 q9kKxBV65biL7NmWMgqvDn7q9k0a8OPnxm+NhTO+9HvYzt0wnxSQZ50dNctAix7GgKCvu
	 zC36vptRFfwd9zURiK/bmlq13AzjjLBkHfv/PuShe+w8D8od9G/O3rrMXNs8KTA5xveSC
	 JbuA/w821PaIFI0vj9YqRUajIAyDjFoO5j0fd/j3h77lqIWOF1QADAlGQyrYoizlZPGec
	 3MOacr+4gnfCw7zGBraQs4kO6g+OtDtOrFiZfNzwNSc9nBwcvVeW6zRm9xd+yDEJakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LUa+VEo+;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725EE606A32D
	for <brcm80211@lists.linux.dev>; Sat,  7 Nov 2026 07:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 725EE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LUa+VEo+
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso697957a12.0
        for <brcm80211@lists.linux.dev>; Fri, 06 Nov 2026 23:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036195; x=1794640995;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=eYSCmelGTmk1XY/NTrQIcy0GQMc6DNsnlbOt11zUfpeg4paxzyo1btCSgioxosCE2b
         7+pRfZhz1bX8ICp98Hf97KngYYX1ZE6TgqDNAFIHlMJiCbmXuujPeyGeG3t6xWHghG1C
         0N4pz/Zvf3zyrFyfEOGg7ljxG9pCOGs+TeJeujhNCk1wHpqFhHY9LxLUd9kFsNXBKHLP
         ApGzyNPD6MqiTsGcHmot0Jvpj9ayHUpqkQwYGJvxmEu45NJiZI6fVX3UmsJJqysAYqb/
         4DOgGntfeJVE8i7IGqu8oTUQdMv04kWX7D5k62JPs+7o9qTJ2orIOEcImmp+I18/SW0U
         bPAQ==
X-Forwarded-Encrypted: i=1; AL+hErGclagKVvIGoBzUIBRLlYpfQps2mw+hzyR3Lsqto/ElttEoHpu6fXjkDmHXrUF/zmuYI13r9GXuwl8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/45WkGTt6gMKQ4MDc0UsKJPlCHTRB+g8K0GmBhB5NydHIO6wTa
	/WGESSQYAmrwKh1KrecL7YW8+fg4ed+5oajFh0Q2fjq0sOG9/CfG1C/ZIAPEXilE8xg+RHeRclz
	YJ2mPofiQkqs/oAhsU/uAKkq52TlSY3JRDdiVabPaX5aTqX0/RJKz8SLSuAKbE88kPPTrLO1Wm6
	Nn5nOU20Af9XeUC5OCi0F4G5HTM0fL00/d+xF6Ogn8ZWUVUdrvReC2OPhvr1PyMdrPT+hgz9f3l
	uETipdklC/O91OWfp+nNg==
X-Gm-Gg: AYBFou1GOtK18sqXOvq9VRKvRHi17aquFGiRRqdqsHMU9noGluYvSSMMTzG/nNexv3v
	sAobnRqHF1IH+D96afUdMhb1XN88prZ/YFanoC+IwZNwgVu3JUbO5UicVlKOlb0FMNgQUd6ouFF
	fTvv/iJD5y1xNVBy867jJW24Wxmmfl+G3b20OdWp0xjzJRbdakB6gymQ1QFY5KLU/9dusPGyH3e
	26KVIkccW0hBsaWao9/bSUjMSeTu+QBauK9nJez2ROQd3ywe+FWAHKIJNYanWkh//fFicCYioql
	VC2en7vWRdXDWMN5EKN/gxaGW2H9Um/rezZDWHFt7eOY/QvvabFiZLNSbfoOUw6eC4w6wxx7sRW
	tIzQm53m5wjv56CifwzBoLbYklA4M7HBcNZvmb5/gXRzuaKQv5tf6Zrnx3tuB8QEdyv45mze+xu
	mCF0yIG/Ym5n3l8owQrIPvlLn8GJZCgzUx+VzOAYs=
X-Received: by 2002:a17:90b:2f87:b0:3a8:a1f6:3b32 with SMTP id 98e67ed59e1d1-3b0db6d2440mr4791492a91.38.1794036194558;
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1058d4f27sm1163848a91.3.2026.11.06.23.23.14
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c40bbd26f74so124112966b.0
        for <brcm80211@lists.linux.dev>; Fri, 06 Nov 2026 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794036192; x=1794640992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=LUa+VEo+EJSOSkrieZJlmcmp2l3PWr6JdSPqfow08sjFa4PH028+pvmtWSjfI5Cgcz
         ZSyS94OICnrqZtlKCCepVc7lIDUdz2OtZoiWXha5J4trJFZa5rQ96ZvjqvNIg8aW4erA
         Z+BgilDH+hxP9ihSAIAN1UfrFPuzlrsAfPiOQ=
X-Forwarded-Encrypted: i=1; AL+hErEzHjK3HLqIkwjzzlAhoFRoLTJERna2RMOkH4ndjiTPOHNUcDn6Jh3C8s3KNstRDM9yeNHPOwLSFQ8=@lists.linux.dev
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369013966b.43.1794036192736;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369012066b.43.1794036192265;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569fa54sm134100066b.58.2026.11.06.23.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Sat, 07 Nov 2026 08:23:10 +0100
Message-ID: <1a1b4e3cb30.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106191826.4ddb997a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
 <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <20261106191826.4ddb997a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 6 november 2026 19:18:32 schreef André Eikmeyer <dev@deq.rocks>:

> On Fri, 06 Nov 2026 18:36:52 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>
>> Sorry, you lost me there. What is the relation between the patch in
>> this subject and D3 ack.
>
> Hi Arend,
>
> D3_INFORM and D3_ACK are mailbox messages, and 05 changes how they are
> exchanged. Without 05 brcmfmac writes D3_INFORM to the TCM mailbox
> and our cursed Apple 4377 firmware on the 9,1 doesn't read it.
>
> That is why I mentioned the D3 ACK timeout handling patch. I
> submitted that because I was sure the firmware wouldn't send it.
> But actually the transport was broken.
>
> https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/
>
> which was superseded by Sebastian's patch here:
>
> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/
>
> So probably for addressing Sebastian's issue this needs to stay
> anyways. My memory served me wrong. I just read that his device is not
> an Apple product, but his patch incidentally worked around the same
> problem. Sorry if i was causing unneccessary noise.

No problem. Thanks for helping me unclutter my head.

Regards,
Arend
>


