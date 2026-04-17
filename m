Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576135AC1B
	for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453350; cv=none; b=HWaqX0I1+3MuR+BeGtz5m033ni7DfqGBNvwiwxtKGEJ8qZlExlcsRlOrXzEAUKLgnnaB4KGV0UmNz9m5md24GGJpcHa9BS1gOl2QZnjKs4wJcw6LwEUXvYP93kJTEQ60SfLjO6RrPZrLTGcz5N9LdFXpUkzmUyGZEBuVldRiB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453350; c=relaxed/simple;
	bh=onBollFxU9gWCj1/4DHA9aCn9z/xNPjGiw84XhEE+uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu1h7qAKgSsfkqmmhphLIohUxMX3JqGzejxIh/BSKICe7WbV0uyeJd7952y1XMSSTM0ZDy60rXU0tx5M3QfiIqOeZGzeYWW4ENQQ9Yz0SNGlvkWlGx0KY5eYblMN9u2hfj+79v6Az8mzvF1gK5vyr+kcolvlb2+mP6fe3h8LbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KhAZ99Ct; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KhAZ99Ct"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-82f69adeecbso520615b3a.2
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453348; x=1777058148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayc3jEms9UC869Y7shBNJreWQPohHdmWhf2wEENgffM=;
        b=G0MV9ALPxWgcA+xQQ1mH/CtQm4O0qvIvWSgvDTh16xOcj9mX4VDxhB8JWH7YDACUum
         aHFjEBjJwbo6kPFwhsiKzSDizz1vKBJiqU1rLFN9tq+JSTWP9a2MKWfl3WiiXOGrrY3c
         YJXHUh5BhdULUR4aDcsfbWe/LbKPsAadKMXs7Hau/CINzZ0zKwylb15zjIaT4NXkbedb
         e80NoIlqpPrc63E05zYyQWzJoQL/1O4IFjru78PG85TY09z8E6gSjjkJZsvMJ2v74qHD
         JALUS8DbmhWYeZ11snq98yi2iY67zAAerrB8SsRTCaCNawIym7P/5w8tJyA1A+c7PPPQ
         yhrg==
X-Gm-Message-State: AOJu0YzsKTNIBAofL23sxXiBNN/Rrsj9/uWe+/2IGi+iiB4DeltGjveX
	XWBt6xjEGoxnU4M8NnjQEzXKR1mKK/5ic8HJqVinXCpqdWi6u0K8ZYKyKUEFhFsMZjXFe0FSPYO
	fQOTm4jrt4CvVC95OTdNSqsXhDX2bFYR/9ID0B5nRNogDq4hAfzSPa8EuHxoYy6VX9TLBbToBGe
	WNRZvtE5tiIW+jg0PD6obDVgjNCoLEPtiAFe1P9lC1EkBXGUVaPh+zINB2Rlke0S7ULsKDwaF25
	u/5HVEHp8OW5fJtqfdXeg==
X-Gm-Gg: AeBDieup7CYVLQS/zKVn8EdDfopxmY0VZIleigeFcvhaXSTUMC2tncIIAJA6j6HwYV6
	/gVvF7sXMGqkGCuHFuQ522htSsYBL+s6vifQmXMuwnLyL0pmRjrj7TppEU1hXetSwFru4eFqLuo
	YyKsP3xTPU55J7FxTuPjb69LZb8BNFPhlwaMQ1mvCtsW6bJTI9aQy9WFt5TfAYygHtX/L8SkSHg
	6rDeVRX7BYfRug7QUJuRKXuiSnkAkQJKvxzAQXHVtkF1ICgm12SDOzlZ3FfhR6Xpl1/sXIxhV2z
	5by5Rus259M8XbDRPscHdGddAN/hdQkcvW0xORZoQ4LIrDqDPe3f6XMVpmkliqNgFRbqC9Ep3RO
	6SUNafK1MTW9hcRKwCdESaN96hLCznuQMj27/JVk0NsFtnBXjxjacLUr6ZcPdCjW3ZxP/fKVsT2
	7INI3q7MHZfJnaryVwQqQdlucBYrUS1Lm3LGtMteM+hqO1tskZP66FV7xDhUS5bhEhmy2rv2o=
X-Received: by 2002:a05:6a00:27ab:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-82f8c8a0442mr3916660b3a.13.1776453348132;
        Fri, 17 Apr 2026 12:15:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-90.dlp.protect.broadcom.com. [144.49.247.90])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-82f8e966da4sm179331b3a.1.2026.04.17.12.15.47
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:15:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acafc224a8so28124636d6.1
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776453346; x=1777058146; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ayc3jEms9UC869Y7shBNJreWQPohHdmWhf2wEENgffM=;
        b=KhAZ99CtqSIw/hbvdiJ6yG0G5k2cu+DbGZu5+MMPrfXe2d1GKEfn3V+q8R4M6ULJmk
         w4+ZouFrP5Hje5rCLKCXbYhE197ZVNlqB4Az9IA/R5TMh+eOVp7+KUXL/7sQ3nUP7Y3P
         JarJ7KaIpwl+w4vh/Ghl2Xi9MVPNgtGaoMSV8=
X-Received: by 2002:a05:6214:21e6:b0:89c:4ea7:a70f with SMTP id 6a1803df08f44-8b028047ac8mr68671766d6.14.1776453346481;
        Fri, 17 Apr 2026 12:15:46 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:89c:4ea7:a70f with SMTP id 6a1803df08f44-8b028047ac8mr68670746d6.14.1776453345482;
        Fri, 17 Apr 2026 12:15:45 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac77546sm16682886d6.17.2026.04.17.12.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:15:44 -0700 (PDT)
Message-ID: <a612564e-7338-430a-b7d8-8276adb45b05@broadcom.com>
Date: Fri, 17 Apr 2026 21:15:42 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcm80211: change current_bss to a
 FAM
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211@lists.linux.dev>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211-dev-list.pdl@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260331233238.23527-1-rosenp@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260331233238.23527-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 01/04/2026 01:32, Rosen Penev wrote:
> Change to a single allocation with kzalloc_flex and remove some
> boilerplate.
> 
> Done as a FAM instead of value to keep -> usage in codebase.

I get it and it looks a bit like a trick, but....

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   .../broadcom/brcm80211/brcmsmac/main.c        | 32 ++-----------------
>   .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>   2 files changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> index c7eaf160e1fa..4f57d64b1dd3 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> @@ -418,21 +418,12 @@ static int brcms_chspec_bw(u16 chanspec)
>   	return BRCMS_10_MHZ;
>   }
> 
> -static void brcms_c_bsscfg_mfree(struct brcms_bss_cfg *cfg)
> -{
> -	if (cfg == NULL)
> -		return;
> -
> -	kfree(cfg->current_bss);
> -	kfree(cfg);
> -}
> -

... it does clearly give some code reduction.

>   static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
>   {
>   	if (wlc == NULL)
>   		return;
> 
> -	brcms_c_bsscfg_mfree(wlc->bsscfg);
> +	kfree(wlc->bsscfg);
>   	kfree(wlc->pub);
>   	kfree(wlc->modulecb);
>   	kfree(wlc->default_bss);

[...]

> @@ -527,7 +499,7 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
>   		goto fail;
>   	}
> 
> -	wlc->bsscfg = brcms_c_bsscfg_malloc(unit);
> +	wlc->bsscfg = kzalloc_flex(*wlc->bsscfg, current_bss, 1, GFP_ATOMIC);
>   	if (wlc->bsscfg == NULL) {
>   		*err = 1011;
>   		goto fail;
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> index b7ca0d9891c4..e9cbb95a5a17 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> @@ -614,7 +614,7 @@ struct brcms_bss_cfg {
>   	u8 SSID_len;
>   	u8 SSID[IEEE80211_MAX_SSID_LEN];
>   	u8 BSSID[ETH_ALEN];
> -	struct brcms_bss_info *current_bss;
> +	struct brcms_bss_info current_bss[];

It does feel icky to use a flex array for 1:1 object relation. It seems 
the lifetime of both objects is exactly the same so I would consider 
using the value instead of FAM. It would give the same code reduction, 
but making the patch slightly larger.

main.c:	kfree(cfg->current_bss);
main.c:	cfg->current_bss = kzalloc_obj(*cfg->current_bss, GFP_ATOMIC);
main.c:	if (cfg->current_bss == NULL)
main.c:			wlc->bsscfg->current_bss->chanspec = chanspec;
main.c:		rs = &wlc->bsscfg->current_bss->rateset;
main.c:			mcsset_bss = wlc->bsscfg->current_bss;
main.c:		bi = wlc->bsscfg->current_bss->beacon_period << 10;

So it is used in just 4 places not counting the first 3 hits for obvious 
reasons. Not too much effort to use value here so please do that.

Regards,
Arend
