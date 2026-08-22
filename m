Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068741A6800
	for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 18:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424522; cv=none; b=lOfkCY/7CsdDYByaKgKsccA2C7HQ4MsvNk+0uGvnHPe9dOg8pHSzeHJRWfT3jNqU/ZsiMbfmoyePreN3xoiivShpdXRI/lYTzTJhHaEmENyNZo8FpIhIy5Pv/XzrIVl/3eyVIGiCIuXLLko45m5EWfWSUJO09LAboptjVOXqY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424522; c=relaxed/simple;
	bh=6d6rUdI0+Jfdk1co6jNNrUW/hr/DoSlzAd5JsktZzxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGzJ3AqIhqHImvxdp6boiZ16CB+yrOEsW5FgEkrMsRWOotC+I8djVusQTgIVp0/AVIGuRA33VuMmCkm/dKtUy9iz6quQn/rid85Mxw0pbNcf3WRT6pZ+3ps4RwXOALP5IVhqRrn7Q2Zl/FXJ1XLnDgJ4LZG2Sq1LGZmp9WDqmwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iDtIRuAg; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iDtIRuAg"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so2179242a34.2
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787424520; x=1788029320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cVsBYVWeiY0T5Pykgsxe7u4yfSLey0gL7CPFlINqPqE=;
        b=QABtlNMFOq4GQI03rZjm6i6b45gS3TYdqAolRxd7C+PyCs8iTxs9jqe702nSqqGGpp
         7RqPmyO89HGZ8LARsO4aPtL+9khPM7wM2bXc2C0fe3f9Z8xdZHflZbKTLswO5+DeK3cQ
         civfaPk/dC5RvROBGD6tN2ZoIbqLBgc+9Oqk+YnDdwmAguntO/SASh+ycc9SUBhbStcG
         hYZJNneYijpK4nZ2XuPz9q7uTb1OhhrEqU5OpzVRwguhqNyGT8E6k7IIvBV1xq5ajIWo
         LamMCqR+wdEjMgjWY/vy6EqBLErheOPwT2zkJtWxVyt46RewtbOErTf/TzjPoAuXAZ5o
         DKVA==
X-Forwarded-Encrypted: i=1; AHgh+Rob93CgpRRGuyHl7R7F7GqO4CqeBIxVoamykOxd0g/L9sT4uHcIo1r91sgr1kpac+zBj21bOlmdzjo=@lists.linux.dev
X-Gm-Message-State: AFuF++mv3J3vtd1kAmi8WCmGtkW+AlJzh4/0JwoPD7EJYpA8kTKSRHhQ
	b/VyVbDT7wmvh2qwx72S7O9Z3rGOyFBeU3NBV4bFNHVycEDA/8x0zpVoEAClIQk9fqRJGLVLcKM
	V2KQKW+R3awt37AuA+/i9AtMz2s4elBA6z2voODF+EMT4wNhPj1bn+6RnoMWI0ScK1KngtDCETc
	yfdslvAL9/ne/c4zraYs0ntisMT3z3v6yGnCkNTd7GVxDalHA2DnSTq89kFf7WpL8utlmNKQV+4
	cOSUfcVNXx1YMLlMqsAxw==
X-Gm-Gg: AR+sD11rieqXLOtjiOd2b4N7kErZlWNjKzUz5/VyJl73ovUjx+07pPVkK0M7OarWH/m
	nh3AFUnhaOTrGr+ynmm/V3YHkdETJT1od1YwsOmBTNNlVYK3IvU0AIaslPqEAqx0q9IpT1Llp9s
	Q17pGSHS6HvBNxWpvtRJTJ1fjFbjFiQ/8BTdOV3QYKSYSAnOqevleAJb50yAlZYij94L9WIA/Dr
	QMPUYWSuueqHe9gVJhTcB9KkE0J+Y3Boe0rBDAtnLoi6VvCsNlmYrn/5dqlm7+S46Aa1lfNlBET
	g06YaPJzn7VQaI8kFVan3XTqjrtR4mQTF8FFMyxPoLzvauuHxDCUNWnFvvctOdU3bcLKh3c45Lp
	bdQeSVbnnLbK70mSwPYZYhai4JsGm5V/W5a/vf4LltbzO3/lToJ+TBBgiOw7B4sHsXXQ6jPot/+
	MThv9XynbJdOO8V8bbuTTe51JQYigvpevdc4MIIF8=
X-Received: by 2002:a05:6830:3885:b0:7ee:3bdc:9205 with SMTP id 46e09a7af769-7f4619e4e15mr19089285a34.13.1787424519862;
        Sat, 22 Aug 2026 11:48:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f43fe4730csm1905887a34.1.2026.08.22.11.48.39
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:48:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso26118471cf.2
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787424519; x=1788029319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVsBYVWeiY0T5Pykgsxe7u4yfSLey0gL7CPFlINqPqE=;
        b=iDtIRuAgi/4M/ct4gPjGQRbGn/lkO+9uEB8uFBmXTGWygIlOSKHJRskj9IeAq6oOBw
         wl5SVuYql8/3rE0f1PU9JtkuRhvg8LsFhJkPlKRnTkFco/WnvZh7z20GcB5l5NefCg6j
         WQaQfsjZdNFLne1fmJF/SUimn7u5+hpGBhlEs=
X-Forwarded-Encrypted: i=1; AHgh+Rpkhg7VdRGx+eql6ROgnSHxvlCdtgqS2Hj8tzxzp5YpnlfkSxpPpRQzvR8+8sMVuhyJN0+wxE2ZUD0=@lists.linux.dev
X-Received: by 2002:a05:622a:120e:b0:52d:7c2f:7561 with SMTP id d75a77b69052e-52df5c10d4fmr145141871cf.41.1787424518785;
        Sat, 22 Aug 2026 11:48:38 -0700 (PDT)
X-Received: by 2002:a05:622a:120e:b0:52d:7c2f:7561 with SMTP id d75a77b69052e-52df5c10d4fmr145141401cf.41.1787424518308;
        Sat, 22 Aug 2026 11:48:38 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93931452sm19438796d6.26.2026.08.22.11.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:48:37 -0700 (PDT)
Message-ID: <b97d0ca8-ba9b-4817-939a-ed064507cdd7@broadcom.com>
Date: Sat, 22 Aug 2026 20:48:36 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: Add support for BCM4361
 PCIe chipset
To: markuss.broks@gmail.com
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 20/08/2026 19:59, Markuss Broks via B4 Relay wrote:
> From: Markuss Broks <markuss.broks@gmail.com>
> 
> Those are the required changes for the BCM4361 PCIe chipset support.
> BCM4361 is a dual band 2.4GHz and 5GHz WiFi + Bluetooth combo chipset,
> installed on several mobile devices, such as Samsung Galaxy S9.
> 
> Tested on Samsung Galaxy S9 (SM-G960F), where it's connected by PCIe link.

Could you share the log when the device is bound to brcmfmac driver? I 
would like to know what the firmware version is which you tested.

Regards,
Arend
